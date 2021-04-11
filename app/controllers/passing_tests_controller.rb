# frozen_string_literal: true

class PassingTestsController < ApplicationController
  before_action :find_passing_test, only: %i[show result update gist]
  before_action :refresh_flash_message, only: %i[update]

  def show; end

  def result; end

  def update
    if params[:answer_ids].blank?
      flash[:alert] = t(".empty_answer")
      render :show
      return
    end

    @passing_test.accept!(params[:answer_ids])
    if @passing_test.completed? || @passing_test.time_ended?
      flash_message = {}
      if @passing_test.test_passed?
        result = BadgeCheckService.new(current_user, @passing_test).call
        flash_message = { notice: t(".you_received_badges", names: result.join(', ')) } if result.present?
      end

      TestsMailer.completed_test(@passing_test).deliver_now
      redirect_to result_passing_test_path(@passing_test), flash_message
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@passing_test.current_question)
    result = service.call

    flash_options = if service.success?
                      create_gist(result.html_url)
                      { notice: result.html_url }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @passing_test, flash_options
  end

  private

  def find_passing_test
    @passing_test = PassingTest.find(params[:id])
  end

  def create_gist(url)
    current_user.gists.create(
      question: @passing_test.current_question,
      url: url
    )
  end

  def refresh_flash_message
    flash.delete(:alert)
  end
end
