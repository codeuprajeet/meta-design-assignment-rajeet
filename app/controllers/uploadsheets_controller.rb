class UploadsheetsController < ApplicationController
  def get_excel; end

  def upload_excel
    @response  = User.insert_user(params[:user_sheet]) if params[:user_sheet].present?
    @errors = "Unsupported Format please add xlsx extension file"  if params[:user_sheet].present? && @response.nil?
    render :get_excel
  end
end
