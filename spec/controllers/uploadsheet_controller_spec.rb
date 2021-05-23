require 'spec_helper'

RSpec.describe UploadsheetsController, type: :controller do

  describe "GET #get_excel" do
    it "returns a success response" do
      get :get_excel, params: {}
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end

  describe "GET #upload_excel" do
    it 'should return sucess' do
      get :upload_excel, params: {}
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end

  describe "POST #upload_excel" do
    it 'should not add user and upadte error with wrong file format' do
      file = ActionDispatch::Http::UploadedFile.new({
        :filename => 'test.xlsx',
        :type => 'image/jpeg',
        :tempfile => File.new("#{Rails.root}/test.xlsx")
      })
      post :upload_excel, params: {user_sheet: file}
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(assigns['response']).to be(nil)
      expect(assigns['errors']).to eq("Unsupported Format please add xlsx extension file")
    end

    it 'should not add user and return error' do
      post :upload_excel, params: {}
      expect(response.status).to eq(400)
      expect( assigns['render_format']).to be(nil)
    end

    it 'should not add user and return error' do
      file = Rack::Test::UploadedFile.new(Rails.root.join("test.xlsx"))
      @total_users = User.all.count
      post :upload_excel, params: {user_sheet: file}
      expect(@total_users + 6).to eq(User.all.count)
      expect(assigns['response'][:saved_user_count]).to eq(6)
      expect(assigns['response'][:failed_user_count]).to eq(2)
      expect(assigns['response'][:total_user]).to eq(8)
    end
  end
end