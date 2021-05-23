require 'spec_helper'

# Change this ArticlesController to your project
RSpec.describe UploadsheetsController, type: :controller do

    # This should return the minimal set of attributes required to create a valid
    # Article. As you add validations to Article, be sure to adjust the attributes here as well.
    let(:valid_attributes) {
        { :title => "Test title!", :description => "This is a test description", :status => "draft" }
    }

    let(:valid_session) { {} }

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
      it 'should return error' do
        
      end
    end
end