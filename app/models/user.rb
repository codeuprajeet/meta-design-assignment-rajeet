
class User < ApplicationRecord
  extend ExcelUploadable

  validates :FirstName, :LastName, presence: true
  validates :EmailId, email: true
  
end
