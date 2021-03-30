# frozen_string_literal: true

class Admin
  class BadgesController < Admin::BaseController
    before_action :find_badge, only: %i[show edit update destroy]

    def index
      @badges = Badge.all
    end

    def show; end

    def new
      @badge = Badge.new
    end

    def edit; end

    def create
      @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to [:admin, @badge], notice: t(".success", title: @badge.name)
      else
        render :new
      end
    end

    def update
      if @badge.update(badge_params)
        redirect_to [:admin, @badge], notice: t(".success")
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy
      redirect_to admin_badges_path
    end

    private

    def find_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :image, :rule_id)
    end
  end
end
