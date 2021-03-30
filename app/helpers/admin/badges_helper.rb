# frozen_string_literal: true

class Admin
  module BadgesHelper
    def badge_header(badge)
      if badge.new_record?
        t('.create_badge')
      else
        t('.edit_badge')
      end
    end
  end
end
