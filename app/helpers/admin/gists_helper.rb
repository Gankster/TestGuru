# frozen_string_literal: true

class Admin
  module GistsHelper
    def gist_hash(url)
      %r{(?<=com/).*}.match(url)
    end
  end
end
