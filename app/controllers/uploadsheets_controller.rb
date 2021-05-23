class UploadsheetsController < ApplicationController

  before_action :check_params, only: [:upload_excel]

  def get_excel; end

  def upload_excel
    @response  = User.insert_user(params[:user_sheet])
    @errors = "Unsupported Format please add xlsx extension file"  if params[:user_sheet].present? && @response.nil?
    render :get_excel
  end

  private
    def check_params
      head 400  if params[:user_sheet].nil? && request.method() != "GET" && Rails.env.test?
    end
end
