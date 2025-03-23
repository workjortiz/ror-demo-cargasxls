require "roo"

class ClientsExcelImporter
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

            country = Country.find_by_iso_code(row_data[4].upcase)
            if !country.present?
                error_log = "No encontrado país con código #{row_data[4]} en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1001] - BY COUNTRY NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "CLIENTS", :action => "NEW/ERROR", :data1 => instance_load, data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end

            taxrule = Taxrule.find_by_code(row_data[5].upcase)
            if !taxrule.present?
                error_log = "No encontrado regla impuesto con código #{row_data[5]} en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1002] - BY TAXRULE NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "CLIENTS", :action => "NEW/ERROR", :data1 => instance_load, data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end

            currency = Currency.find_by_iso_code(row_data[6].upcase)
            if !currency.present?
                error_log = "No encontrado moneda con código #{row_data[6]} en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1003] - BY CURRENCY NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "CLIENTS", :action => "NEW/ERROR", :data1 => instance_load, data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end

            if !row_data[0].present?
                error_log = "Nombre fiscal no ingresado en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1010] - BY FISCAL NAME NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "CLIENTS", :action => "NEW/ERROR", :data1 => instance_load, :data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end

            if !row_data[1].present?
                error_log = "Nombre comercial no ingresado en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1011] - BY COMERCIAL NAME NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "CLIENTS", :action => "NEW/ERROR", :data1 => instance_load, :data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end

            if !row_data[2].present?
                error_log = "Dirección Fiscal  no ingresado en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1011] - BY FISCAL ADDRESS NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "CLIENTS", :action => "NEW/ERROR", :data1 => instance_load, :data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end

            if !row_data[3].present?
                error_log = "Dirección Comercial  no ingresado en la linea: #{iteration_row.to_i}"
                error_code = "ERROR [1011] - BY COMERCIAL ADDRESS NOT FOUND"
                puts "<<!!!>>  #{error_code}"
                BitLoadData.create(:event => "LOAD_EXCEL", :model => "CLIENTS", :action => "NEW/ERROR", :data1 => instance_load, :data2 => error_code, :data3 => error_log, :value1 => iteration_row.to_i).save
                flag_process_row = false
            end


            if flag_process_row
                new_client = Client.new
                new_client.fiscal_name = row_data[0].upcase
                new_client.comercial_name = row_data[1].upcase
                new_client.fiscal_address = row_data[2].upcase
                new_client.comercial_address = row_data[3].upcase
                new_client.short_code = Param.generate_nn("NN_CLIENTS")
                new_client.base64_code = SecureRandom.base64(10)
                new_client.country = country
                new_client.taxrule = taxrule
                new_client.currency = currency
                new_client.save!
            end
        end

        instance_load
    end

end