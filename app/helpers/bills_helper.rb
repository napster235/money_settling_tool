module BillsHelper
  def bill_error(bill)
    if bill.errors.any?
      bill.errors.full_messages.each do |msg|
        msg
      end
    end
  end
end
