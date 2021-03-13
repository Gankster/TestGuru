# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_root_path : super
  end

  def rescue_with_record_not_found
    render plain: t('errors.record_not_found')
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
