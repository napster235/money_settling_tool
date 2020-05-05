module SettleHelper
  def bill_settle(bill)
    'disabled' if bill.settled?
  end
end
