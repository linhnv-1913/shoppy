require "rails_helper"
require "helpers/valid_json_helper.rb"
require "helpers/create_token_helper.rb"

RSpec.describe Api::Admin::ResetPasswordsController, type: :controller do
  include ValidJsonHelper
  include CreateTokenHelper

  context "when token is valid" do
    let(:admin){create :admin}
    subject{get :edit, params: {"id": admin.id, "token": create_valid_token(admin.id)}}

    it "has 200 status code" do
      expect(subject.status).to eq(200)
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when token is invalid" do
    let(:admin){create :admin}
    subject{get :edit, params: {"id": admin.id, "token": create_invalid_token(admin.id)}}

    it "has 401 status code" do
      expect(subject.status).to eq(401)
    end

    it "has responds a message as json" do
      expect(valid_json? subject.body).to be true
    end
  end
end
