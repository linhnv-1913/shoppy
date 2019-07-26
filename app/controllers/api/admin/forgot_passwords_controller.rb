class Api::Admin::ForgotPasswordsController < ApplicationController
  before_action :load_admin, only: :create

  def create
    domain = params[:domain]
    message = ForgotPasswordsService.call @admin, domain
    render json: message
  end

  private
  def load_admin
    @admin = ::Admin.find_by! email: params[:email]
  end
end
