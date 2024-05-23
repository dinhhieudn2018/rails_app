class DataExportsController < ApplicationController
  def export_to_excel
    @data = User.all

    Axlsx::Package.new do |p|
      p.workbook.add_worksheet(name: "Data") do |sheet|
        # Add headers
        sheet.add_row ['name', 'email']

        # Add data rows
        @data.each do |item|
          sheet.add_row [item.name, item.email]
        end
      end
      send_data p.to_stream.read, type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", filename: "data_export.xlsx"
    end
  end
end