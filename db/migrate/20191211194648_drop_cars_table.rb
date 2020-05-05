class DropCarsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :cars
  end
end
