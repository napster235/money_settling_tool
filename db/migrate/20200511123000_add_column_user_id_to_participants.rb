class AddColumnUserIdToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :user_id, :integer
  end
end