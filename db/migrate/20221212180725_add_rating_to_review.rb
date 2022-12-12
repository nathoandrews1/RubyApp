# frozen_string_literal: true

# Added migration to add rating to review
class AddRatingToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :rating, :integer
  end
end
