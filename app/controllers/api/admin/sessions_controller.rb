class Api::Admin::SessionsController < ApplicationController
  before_action :load_admin, only: :create

  def create
    data = AuthenticationService.call @admin, params[:password], params[:remember_me]
    render json: data
  end

  private
  def load_admin
    @admin = ::Admin.find_by email: params[:email]
  end

  def login_params
    params.permit :email, :password, :remember_me
  end
end
