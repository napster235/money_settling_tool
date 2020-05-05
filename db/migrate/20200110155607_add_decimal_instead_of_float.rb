class AddDecimalInsteadOfFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :bills, :cost_per_person, :decimal

  end
end
