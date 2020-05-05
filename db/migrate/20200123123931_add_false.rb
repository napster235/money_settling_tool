class AddFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :bills_participants, :settled, :boolean, default: false

  end
end
