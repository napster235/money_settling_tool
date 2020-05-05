module ParticipantsHelper
  def participant_error(participant)
    if participant.errors.any?
      participant.errors.full_messages.each do |msg|
        msg
      end
    end
  end
end
