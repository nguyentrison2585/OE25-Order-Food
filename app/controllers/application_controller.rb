class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: User::USER_PARAMS
    devise_parameter_sanitizer.permit :account_update, keys: User::USER_PARAMS
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def require_logged_in
    return if user_signed_in?

    flash[:danger] = t "not_logged_in"
    redirect_to signin_path
  end
end
