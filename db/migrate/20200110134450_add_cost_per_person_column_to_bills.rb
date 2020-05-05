class AddCostPerPersonColumnToBills < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :cost_per_person, :integer
  end
end
