# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :passing_tests, dependent: :destroy
  has_many :tests, through: :passing_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :first_name, :last_name, presence: true

  def passing_test(test)
    passing_tests.order(created_at: :desc).find_by(test_id: test.id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    is_a?(Admin)
  end
end
