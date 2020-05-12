class AddUserIdColumnToBillsParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :bills_participants, :user_id, :integer
  end
end
