# frozen_string_literal: true

class Admin
  class GistsController < Admin::BaseController
    def index
      @gists = Gist.all
    end
  end
end
