# frozen_string_literal: true

class Test < ApplicationRecord
  def self.by_category(title)
    Test.joins('LEFT JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: title })
        .order(id: :desc)
  end
end
