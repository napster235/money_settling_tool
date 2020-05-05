class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :car_name, null: false
      t.string :model_of_car, null: false
      t.string :fuel, null: false
      t.integer :engine_capacity, null: false
      t.integer :number_of_seats, null: false

      t.timestamps
    end
  end
end
