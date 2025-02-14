class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    return I18n.locale = locale if I18n.available_locales.include?(locale)

    I18n.locale = I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "flash.please_login"
    redirect_to login_path
  end

  def paginate collections
    collections.paginate(page: params[:page],
      per_page: params[:per_page] || Settings.paginate.per_page)
  end
end
