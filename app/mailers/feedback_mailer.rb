# frozen_string_literal: true

class FeedbackMailer < ApplicationMailer
  def send_feedback(user, params)
    @user = user
    @feedback = params[:feedback]
    mail to: Admin.first.email, subject: t('.subject')
  end
end
