class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @bills = Bill.all
    @participants = Participant.all
    @bills_participant = BillsParticipant.all
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end
end
