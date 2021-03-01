# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  alidates :body, presence: true
end
