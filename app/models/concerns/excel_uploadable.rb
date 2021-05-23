
module ExcelUploadable
  extend ActiveSupport::Concern

  def insert_user(file)
    tempfile =  Creek::Book.new  file
    saved_user_count = 0
    failed_user_count = 0
    total_user = 0
    tempfile.sheets.each do |sheet|
      sheet.rows.each_with_index do |row, index|
        next if index == 0
        total_user +=1
        user = self.new(FirstName: row["A#{index + 1}", LastName: row["B#{index + 1}", EmailId: row["C#{index + 1}"])
        if user.save
          saved_user_count +=1
        else
          failed_user_count +=1
        end
        byebug
        puts " -=- =- -==- -= =-= -="
      end
    end
  end
end