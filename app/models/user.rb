# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests
  has_many :tests, through: :passing_test
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'

  def tests_by_level(level)
    tests.where(level: level)
  end
end
