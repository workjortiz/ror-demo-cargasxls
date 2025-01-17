require 'roo'

class ProductsExcelImporter

    def initialize(file)
        @file = file
    end

    def import
        spreadsheet = Roo::Spreadsheet.open(@file,path)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |iteration_row|
            row_data = Hash[ [header, spreadsheet.row(iteration_row)].transpose ]
            Product.create!(row_data)
        end
    end
end