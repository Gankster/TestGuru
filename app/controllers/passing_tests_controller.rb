# frozen_string_literal: true

class PassingTestsController < ApplicationController
  before_action :find_passing_test, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @passing_test.accept!(params[:answer_ids])
    if @passing_test.completed?
      TestsMailer.completed_test(@passing_test).deliver_now
      redirect_to result_passing_test_path(@passing_test)
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
end
