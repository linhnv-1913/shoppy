class Api::ForgotPasswordsController < ApplicationController
  before_action :load_user, only: :create

  def create
    domain = params[:domain]
    message = ForgotPasswordsService.call @user, domain
    render json: message
  end

  private
  def load_user
    @user = User.find_by! email: params[:email]
  end
end
