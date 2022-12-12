# frozen_string_literal: true

# Will create reviews attached to cars, belongs_to :car and :user
class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :username
      t.text :reviewbody
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
