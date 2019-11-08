class Api::ForgotPasswordsController < ApplicationController
  # before_action :load_user, only: :create

  def create
    domain = params[:domain]
    SendEmailWorker.perform_in 10.seconds.from_now, params[:email], domain
    render json: {message: I18n.t(".forgot_password_controller.send_email_success", email: params[:email])}
  end

  private
  def load_user
    @user = User.find_by! email: params[:email]
  end
end
