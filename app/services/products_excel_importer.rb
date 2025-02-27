require "roo"

class ProductsExcelImporter
    def initialize(file)
        @file = file
    end

    def import
        instance_load = Time.now.strftime("%y%m%d%H%M%S")
        spreadsheet = Roo::Spreadsheet.open(@file.path)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |iteration_row|
            flag_process_row = true
            row_data = spreadsheet.row(iteration_row)

            brand = Brand.find_by_code(row_data[1].upcase)
            if !brand.present?
                error_log = "No encontrado codigo marca #{row_data[1]} en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1001] - BY BRAND NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "PRODUCTS", :action => "NEW/ERROR", :data1 => instance_load, :data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end

            um = UnitMeasure.find_by_iso_code(row_data[2].upcase)
            if !um.present?
                error_log = "No encontrado unidad de medida #{row_data[1]} en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1002] - BY UNIT MEASURE NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "PRODUCTS", :action => "NEW/ERROR", :data1 => instance_load, :data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end

            if  !row_data[0].present?
                error_log = "Descripción no ingresada en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1003] - BY DESCRIPTION NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "PRODUCTS", :action => "NEW/ERROR", :data1 => instance_load, :data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end

            if flag_process_row
                new_product = Product.new
                new_product.description = row_data[0].upcase
                new_product.short_code = (Param.generate_nn("NN_PRODUCTS"))
                new_product.long_code = Product.generate_long_code(brand, um)
                new_product.base64_code = SecureRandom.base64(10)
                new_product.unit_measure = um
                new_product.brand = brand
                if !new_product.eval_exist
                    new_product.save
                    BitLoadData.create(:event => "LOAD_EXCEL", :model => "PRODUCTS", :action => "NEW/COMPLETE", :data1 => instance_load, :data2 => new_product.long_code  , :data3 => new_product.description , :value1 => iteration_row.to_i).save
                else
                    error_log = "Registro previamente registrado #{row_data[1]} en la linea: #{iteration_row.to_i}"
                    error_code = "ERROR [2001] - PRODUCT PREVIOUSLY CREATED"
                    puts "<<!!!>>  #{error_code}"
                    BitLoadData.create(:event => "LOAD_EXCEL", :model => "PRODUCTS", :action => "NEW/ERROR", :data1 => instance_load, :data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                end
            end
        end

        instance_load
    end
end
