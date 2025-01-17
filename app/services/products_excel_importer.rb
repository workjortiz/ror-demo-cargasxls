require 'roo'

class ProductsExcelImporter

    def initialize(file)
        @file = file
    end

    def import

        error_log = Array.new

        spreadsheet = Roo::Spreadsheet.open(@file.path)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |iteration_row|
            flag_process_row = true
            row_data = spreadsheet.row(iteration_row)
            puts row_data[0]
            puts row_data[1]
            puts row_data[2]

            brand = Brand.find_by_code(row_data[1].upcase)
            if !brand.present?
                error_log << "No encontrado codigo marca #{row_data[1]} en la linea: #{iteration_row.to_i}"
                flag_process_row = false
            end

            um = UnitMeasure.find_by_iso_code(row_data[2].upcase)
            if !um.present?
                error_log << "No encontrado unidad de medida #{row_data[1]} en la linea: #{iteration_row.to_i}"
                flag_process_row = false
            end

            if flag_process_row
                ref = Product.where(brand: brand.id).maximum(:short_code)
                new_product = Product.new
                new_product.short_code = ref+1
                new_product.long_code = "" + brand.country.iso_code + brand.code[0..1] + um.iso_code[0] + new_product.short_code.to_s
                new_product.description = row_data[0].upcase
                new_product.base64_code = SecureRandom.base64(10)
                new_product.unit_measure = um
                new_product.brand = brand
                new_product.save
            end

        end
    end
end

