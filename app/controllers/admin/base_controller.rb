# frozen_string_literal: true

class Admin
  class BaseController < ApplicationController
    before_action :admin_required!

    layout 'admin'

    private

    def admin_required!
      redirect_to root_path, alert: 'Access Denied!' unless admin?
    end
  end
end
