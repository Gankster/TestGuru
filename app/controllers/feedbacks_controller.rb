# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def new; end

  def create
    FeedbackMailer.send_feedback(current_user, feedback_params).deliver_now
    redirect_to root_path, notice: t('.success')
  end

  private

  def feedback_params
    params.permit(:feedback)
  end
end
