# frozen_string_literal: true

# Added migration to add name to user
class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
  end
end
