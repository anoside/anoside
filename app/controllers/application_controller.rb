class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_accept_language_id


  private

  def set_accept_language_id
    if session[:accept_language].blank? && !user_signed_in?
      language_codes = Language.pluck(:code)
      language_code = http_accept_language.compatible_language_from(language_codes).presence || 'en'

      session[:accept_language_id] = Language.find_by_code(language_code).id
    end
  end
end
