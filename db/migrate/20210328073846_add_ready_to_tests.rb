# frozen_string_literal: true

class AddReadyToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :ready, :boolean, default: false
  end
end
