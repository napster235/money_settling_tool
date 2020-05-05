class AddDecimalInsteadOfFloats < ActiveRecord::Migration[6.0]
  def change
    change_column :bills, :cost_per_person, :decimal, :precision => 10, :scale => 2

  end
end
