class SendEmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform email, domain
    @user = User.find_by! email: email

    exp = Settings.json_web_token.reset_password_exp.second.from_now
    token = JsonWebToken.encode({user_id: @user.id}, exp)
    AuthenticableMailer.reset_password(@user, token, domain).deliver
  end
end
