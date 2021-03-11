# frozen_string_literal: true

class UpgradePassingTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :passing_tests, :current_question, foreign_key: { to_table: :questions }
    add_column :passing_tests, :correct_questions, :integer, default: 0
  end
end
