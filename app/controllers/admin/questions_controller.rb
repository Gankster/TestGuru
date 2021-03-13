# frozen_string_literal: true

class Admin
  class QuestionsController < Admin::BaseController
    before_action :find_question, only: %i[show destroy edit update]
    before_action :find_test, only: %i[create new]

    def show; end

    def new
      @question = @test.questions.build
    end

    def edit; end

    def update
      if @question.update(question_params)
        redirect_to [:admin, @question]
      else
        render :edit
      end
    end

    def create
      @question = @test.questions.build(question_params)

      if @question.save
        redirect_to [:admin, @question]
      else
        render :new
      end
    end

    def destroy
      @question.destroy
      redirect_to [:admin, @question.test], notice: t('.deleted')
    end

    private

    def question_params
      params.require(:question).permit(:body)
    end

    def find_test
      @test = Test.find(params[:test_id])
    end

    def find_question
      @question = Question.find(params[:id])
    end
  end
end
