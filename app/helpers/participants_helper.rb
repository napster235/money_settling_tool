module ParticipantsHelper
  def participant_error(participant)
    if participant.errors.any?
      participant.errors.full_messages.each do |msg|
        msg
      end
    end
  end

  def current_user_bills
    # Bill.where(:user_id => current_user.id)
    current_user.bills
  end
end
