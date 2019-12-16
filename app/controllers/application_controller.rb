class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def require_logged_in
    return if logged_in?

    flash[:danger] = t "not_logged_in"
    redirect_to login_path
  end
end
