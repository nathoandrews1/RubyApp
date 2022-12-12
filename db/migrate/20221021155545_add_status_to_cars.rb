# frozen_string_literal: true

# Allows admins to add a status to cars, either active or inactive
class AddStatusToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :status, :string
  end
end
