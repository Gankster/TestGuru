# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  protected

  def rescue_with_record_not_found
    render plain: "Record not found."
  end
end
