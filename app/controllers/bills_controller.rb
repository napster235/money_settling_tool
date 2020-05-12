class BillsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

  def index
    # @bills = Bill.all
    @q = Bill.where(:user_id => current_user.id).ransack(params[:q])
    @bills = @q.result.paginate(:page => params[:page], :per_page => 10)
    # @bills = @q.result.page(params[:page])
  end

  def new
    @new_bill = Bill.new
    @participants = Participant.all
    render partial: "shared/new_modal.js.erb"
  end

  def create
    @new_bill = Bill.create(bill_params.merge({user_id: current_user.id}))
    redirect_to bills_path
  end

  def edit
    @participants = Participant.all
    @bill = Bill.find_by_id(params[:id])
    if @bill.nil?
      redirect_to dasbills_pathhboard_path
    else
      render :edit
    end
  end

  def update
    @bill = Bill.find_by_id(params[:id])
    if @bill.nil? || @bill.update(bill_params)
      redirect_to bills_path
    else
      render :edit
    end
  end

  def destroy
    @bill = Bill.find_by_id(params[:id])
    if @bill.nil? 
      redirect_to bills_path
    else
      @bill.destroy
      redirect_to bills_path
    end
  end

  def import
    Bill.import(params[:file])
    redirect_to bills_path, notice: 'Data imported'
  end

  private

    def bill_params
      params.require(:bill).permit(:name, :total_amount, :description, :participant_ids => [])
    end
end
