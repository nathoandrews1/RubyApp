# frozen_string_literal: true

# This Class creates cars
class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :engine
      t.float :mpg
      t.float :price

      t.timestamps
    end
  end
end
