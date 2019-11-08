require "rails_helper"
require "helpers/valid_json_helper.rb"

RSpec.describe Api::ForgotPasswordsController, type: :controller do
  include ValidJsonHelper

  context "when send email success" do
    let(:password){ "Abcd1234" }
    let(:user){create :user, password: password, password_confirmation: password}
    subject{post :create, params: {"email": user.email}}

    it "has 200 status code" do
      expect(subject.status).to eq(200)
    end

    it "has responds user data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when send email fail" do
    it "response an exception" do
      mail = double("ActionMailer")
      allow(mail).to receive(:reset_password).and_raise(Modules::SendEmailError)
      expect{mail.reset_password}.to raise_error(Modules::SendEmailError)
    end
  end
end
