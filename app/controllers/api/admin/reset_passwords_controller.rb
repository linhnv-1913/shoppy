class Api::Admin::ResetPasswordsController < ApplicationController
  before_action :load_admin, only: :edit

  def edit
    render json: @admin
  end

  private
  def load_admin
    decode_data = JsonWebToken.check_valid_token! params[:token]
    @admin = ::Admin.find_by! id: decode_data[:user_id]
  end
end
