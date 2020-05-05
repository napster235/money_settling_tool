class AddIdAndSettledColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :bills_participants, :id, :primary_key
    add_column :bills_participants, :settled, :boolean
  end
end
