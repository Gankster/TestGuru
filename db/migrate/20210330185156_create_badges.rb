# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.references :rule, null: false, foreign_key: { to_table: :badge_rules }

      t.timestamps
    end
  end
end
