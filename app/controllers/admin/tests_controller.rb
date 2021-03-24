# frozen_string_literal: true

class Admin
  class TestsController < Admin::BaseController
    before_action :find_tests, only: %i[index update_inline]
    before_action :find_test, only: %i[show edit destroy update update_inline]

    def index; end

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

    def update_inline
      if @test.update(test_params)
        redirect_to admin_tests_path
      else
        render :index
      end
    end

    def destroy
      @test.destroy
      redirect_to admin_tests_path
    end

    private

    def find_tests
      @tests = Test.all
    end

    def find_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:category_id, :title)
    end
  end
end
