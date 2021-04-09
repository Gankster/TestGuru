# frozen_string_literal: true

class BadgeRule < ApplicationRecord
  has_many :badges, dependent: :destroy, foreign_key: 'rule_id'

  validates :name, :kind, :value, presence: true
  validates :kind, :value, numericality: { only_integer: true }

  enum kind: { first_try: 0, all_tests_by_category: 1, all_tests_by_level: 2 }
end
