# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found
  before_action :authenticate_user!

  helper_method :current_user, :logged_in?

  protected

  def rescue_with_record_not_found
    render plain: "Record not found."
  end

  private

  def authenticate_user!
    return if current_user

    cookies[:return_to_path] = request.fullpath
    redirect_to login_path, alert: 'You must be authorized!'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
