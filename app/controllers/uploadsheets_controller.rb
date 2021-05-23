class UploadsheetsController < ApplicationController
  def get_excel; end

  def upload_excel
    User.insert_user(params[:picture]) 
  end
end
