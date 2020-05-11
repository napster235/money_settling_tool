class Bill < ApplicationRecord
  require 'csv'
  validates :name, presence: true
  validates :total_amount, presence: true
  has_and_belongs_to_many :participants
  belongs_to :user, optional: true

  default_scope { order(created_at: :desc) }
  # scope :with_higher_value, ->(length = 1) { where("LENGTH(total_amount) > ?", length) }
  # scope :with_higher_value, -> { where("cost_per_person > 32") }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Bill.create! row.to_hash
    end
  end

  def bill_name_and_amount
    "#{name} bill, amount #{total_amount}"
  end

  def get_cost_per_participant
    bill_cost = if participants.present?
                  (((total_amount / participant_ids.count.to_f) * 100.0).ceil / 100.0).round(2)
                else
                  0
                end

    "%.2f" % bill_cost
  end

  def get_settled
    participants = participant_ids.count
    payed = BillsParticipant.where(bill_id: id, settled: true).count

    if payed > 0
      if payed == participants
        'total'
      else
        'partial'
      end
    else
      'unpaid'
    end
  end
end
