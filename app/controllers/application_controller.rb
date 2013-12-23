class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_accept_language_id

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  has_mobile_fu false


  protected

  def configure_permitted_parameters
    attrs = [:username, :password, :accept_language_id, :terms_of_service]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(attrs) }
  end

  private

  def set_accept_language_id
    if session[:accept_language].blank? && !user_signed_in?
      language_codes = Language.pluck(:code)
      language_code = http_accept_language.compatible_language_from(language_codes).presence || 'en'

      session[:accept_language_id] = Language.find_by_code(language_code).id
    end
  end
end
