
module ExcelUploadable
  extend ActiveSupport::Concern

  def insert_user(file)
    begin
      tempfile = Creek::Book.new  file
      saved_user_count = 0
      failed_user_count = 0
      total_user = 0
      sheets = tempfile.sheets
      not_saved_rows = []
      tempfile.sheets.each_with_index do |sheet, sheet_index|
        sheet.rows.each_with_index do |row, row_index|
          next if row_index == 0
          total_user +=1
          user = self.new(FirstName:row["A#{row_index+1}"], LastName: row["B#{row_index+1}"], EmailId: row["C#{row_index+1}"])
          if user.save
            saved_user_count +=1
          else
              not_saved_rows << create_row_errors(row_index + 1, sheet&.name, user)
            failed_user_count +=1
          end
        end
      end
      return { saved_user_count: saved_user_count, failed_user_count: failed_user_count, total_user: total_user, errors: not_saved_rows }
      rescue Exception => exc
         return nil
      end
  end


  def create_row_errors (row, sheet_index, user)
    return {row: row, sheet_name: sheet_index, errrors: user.errors}
  end


end