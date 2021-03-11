# frozen_string_literal: true

class ChangeUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :password, :password_digest
    add_index :users, :email, unique: true
  end
end
