# frozen_string_literal: true

class User < ApplicationRecord
  has_many :passing_tests, dependent: :destroy
  has_many :tests, through: :passing_tests
  has_many :authored_tests, inverse_of: :author, dependent: :destroy

  validates :email, :password, :name, presence: true

  def passing_test(test)
    passing_tests.order(created_at: :desc).find_by(test_id: test.id)
  end
end
