class CreatePassingTests < ActiveRecord::Migration[6.1]
  def change
    create_table :passing_tests do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.boolean :passed, default: false

      t.timestamps
    end
  end
end
