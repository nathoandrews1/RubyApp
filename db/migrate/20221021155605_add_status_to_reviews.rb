# frozen_string_literal: true

# Allows admins to add a status to reviews, either active or inactive
class AddStatusToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :status, :string
  end
end
