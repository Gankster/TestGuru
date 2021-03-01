# frozen_string_literal: true

class User < ApplicationRecord
  has_many :passing_tests, dependent: :destroy
  has_many :tests, through: :passing_tests
  has_many :authored_tests, inverse_of: :author, dependent: :destroy

  def tests_by_level(level)
    tests.where(level: level)
  end
end
