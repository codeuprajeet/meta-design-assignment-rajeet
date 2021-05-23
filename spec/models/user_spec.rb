require 'spec_helper'

RSpec.describe User, type: :model do

  it "is valid with valid attributes" do
    expect(User.new(FirstName: 'test', LastName: 'test', EmailId: "test@gm.com")).to be_valid
  end

  it "is not valid without a FirstName" do
    expect(User.new(FirstName: '', LastName: 'last', EmailId: "test@gm.com")).to_not be_valid
  end

  it 'is not valid without LastName' do
    expect(User.new(FirstName: 'first', LastName: '', EmailId: "test@gm.com")).to_not be_valid
  end

  it 'is not valid with wrong EmailFormat LastName' do
    expect(User.new(FirstName: 'first', LastName: 'last', EmailId: "test")).to_not be_valid
  end

  describe 'model methods' do
    it 'should insert users' do
      file = Rack::Test::UploadedFile.new(Rails.root.join("test.xlsx"))
      total_user = User.all.count
      res = User.insert_user(file)
      expect(total_user + res[:saved_user_count]).to be(User.all.count)
      expect(res[:total_user]).to be(8)
      expect(res[:errors].count).to be(2)
    end

    it 'should not insert in user' do
      total_user = User.all.count
      res = User.insert_user('')
      expect(total_user).to be(User.all.count)
      expect(res).to be(nil)
    end
  end

end