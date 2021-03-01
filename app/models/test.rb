# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :passing_tests, dependent: :destroy
  has_many :users, through: :passing_tests

  def self.by_category(title)
    Test.joins('LEFT JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: title })
        .order(id: :desc)
  end
end
