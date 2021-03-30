# frozen_string_literal: true

class MarkTestsAsSuccess < ActiveRecord::Migration[6.1]
  def change
    rename_column :passing_tests, :passed, :succeeded

    PassingTest.where(succeeded: false, current_question_id: nil).find_each do |pt|
      pt.succeeded = pt.test_passed?
      pt.save
    end
  end
end
