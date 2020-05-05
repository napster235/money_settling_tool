class CreatejoinTableBillsParticipants < ActiveRecord::Migration[6.0]
  #def change
  #  create_join_table :bills, :participants do |t|
  #    #t.index [:bill_id, :participant_id]
  #    #t.index [:participant_id, :bill_id]
  #
  #    t.integer :bill_id
  #    t.integer :participant_id
  #  end
  #end

  def change
    create_table :bills_participants, :id => false do |t|
      t.integer :bill_id
      t.integer :participant_id
      t.timestamps
    end
  end
end
