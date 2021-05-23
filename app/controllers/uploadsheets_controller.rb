class UploadsheetsController < ApplicationController
  def get_excel; end

  def upload_excel
    @response  = User.insert_user(params[:user_sheet]) if params[:user_sheet].present?
    render :get_excel
    # byebug
  end
end
