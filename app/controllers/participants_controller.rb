# frozen_string_literal: true

class ParticipantsController < ApplicationController
  def index
    # @participants = Participant.all
    @q = Participant.ransack(params[:q])
    @participants = @q.result.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @participant = Participant.find_by_id(params[:id])
    # @bills = Bill.all
  end

  def new
    @new_participant = Participant.new
    @bills = Bill.all
    render partial: "shared/new_modal.js.erb"
  end

  def create
    @new_participant = Participant.create(participant_params)
    redirect_to participants_path
  end

  def edit
    @bills = Bill.all
    @participant = Participant.find_by_id(params[:id])
    if @participant.nil?
      redirect_to participants_path
    else
      render :edit
    end
  end

  def update
    @participant = Participant.find_by_id(params[:id])
    if @participant.nil? || @participant.update(participant_params)
      redirect_to participants_path
    else
      render :edit
    end
  end

  def destroy
    @participant = Participant.find_by_id(params[:id])
    if @participant.nil?
      redirect_to participants_path
    else
      @participant.destroy
      redirect_to participants_path
    end
  end

  def settle
    @participant = Participant.find_by_id(params[:id])
  end

  def import
    Participant.import(params[:file])
    redirect_to participants_path, notice: 'Data imported'
  end

  private

    def participant_params
      params.require(:participant).permit(:first_name, :last_name, :email, :bill_ids => [])
    end
end
