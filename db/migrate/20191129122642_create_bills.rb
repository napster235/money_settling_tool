class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.string :name, null: false
      t.integer( :total_amount, null: false)
      t.string :description, null: false

      t.timestamps
    end
  end
end
