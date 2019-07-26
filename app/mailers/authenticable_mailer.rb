class AuthenticableMailer < ApplicationMailer
  def reset_password authenticable, token, domain
    @authenticable = authenticable
    @token = token
    @domain = domain
    mail to: authenticable.email, subject: "Password reset"
  end
end
