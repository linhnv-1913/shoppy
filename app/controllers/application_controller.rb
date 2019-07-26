class ApplicationController < ActionController::API
  include Modules::ErrorHandler

  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound do
    render json: {message: I18n.t(".error_message.record_not_found")}, status: :not_found
  end

  def set_locale
    locale = extract_locale_from_header

    I18n.locale =
      if locale_valid? locale
        locale
      else
        :en
      end
  end

  private

  def locale_valid? locale
    I18n.available_locales.map(&:to_s).include?(locale)
  end

  def extract_locale_from_header
    accept_language = request.env["HTTP_ACCEPT_LANGUAGE"]
    return unless accept_language

    accept_language.scan(/^[a-z]{2}/).first
  end
end
