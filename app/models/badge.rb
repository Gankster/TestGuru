# frozen_string_literal: true

class Badge < ApplicationRecord
  belongs_to :rule, class_name: 'BadgeRule'
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image, presence: true
end
