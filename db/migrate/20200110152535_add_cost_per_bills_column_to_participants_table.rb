class AddCostPerBillsColumnToParticipantsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :cost_per_bills, :integer
  end
end
