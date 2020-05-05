# frozen_string_literal: true

class BillsParticipant < ApplicationRecord
  default_scope { order(:settled, created_at: :desc) }

  def bill_details
    bill = Bill.find(bill_id)
    participant = Participant.find(participant_id)

    {
       first_name: participant.first_name,
       last_name: participant.last_name,
       bill_name: bill.name,
       bill_id: bill.id,
       cost: bill.get_cost_per_participant
   }
  end
end
