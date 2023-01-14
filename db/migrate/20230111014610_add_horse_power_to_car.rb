class AddHorsePowerToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :horsepower, :integer
  end
end
