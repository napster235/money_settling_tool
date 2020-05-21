module BillsHelper
  def bill_error(bill)
    if bill.errors.any?
      bill.errors.full_messages.each do |msg|
        msg
      end
    end
  end

  def current_user_participants
    # Participant.where(:user_id => current_user.id)
    current_user.participants
  end
end
