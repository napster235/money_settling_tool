# frozen_string_literal: true

class BillsParticipantController < ApplicationController
  def index
    @bills_participant = BillsParticipant.where(:user_id => current_user.id)

    #sql caching
    # @bills_participant = BillsParticipant.all
  end

  def edit
    @participant_bill = BillsParticipant.find_by(participant_id: params[:id], bill_id: params[:bill_id])

    if @participant_bill.settled == false || @participant_bill.settled.nil?
      @participant_bill.update(settled: true)
      redirect_to bills_participant_index_path
    else
      redirect_to bills_participant_index_path
    end
  end
end
