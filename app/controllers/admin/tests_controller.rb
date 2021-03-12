# frozen_string_literal: true

class Admin
  class TestsController < Admin::BaseController
    before_action :find_test, only: %i[show edit update destroy]

    def index
      @tests = Test.all
    end

    def show; end

    def new
      @test = current_user.authored_tests.build
    end

    def create
      @test = current_user.authored_tests.build(test_params)

      if @test.save
        redirect_to [:admin, @test]
      else
        render :new
      end
    end

    def edit; end

    def update
      if @test.update(test_params)
        redirect_to [:admin, @test]
      else
        render :edit
      end
    end

    def destroy
      @test.destroy
      redirect_to admin_tests_path
    end

    def start
      current_user.tests.push(@test)
      redirect_to current_user.passing_test(@test)
    end

    private

    def find_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:category_id, :title)
    end
  end
end
