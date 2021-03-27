# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: :start

  def index
    @tests = Test.ready
  end

  def start
    if @test.questions.count.positive?
      current_user.tests.push(@test)
      redirect_to current_user.passing_test(@test)
    else
      redirect_to root_path, alert: t('.questions_not_found')
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title)
  end
end
