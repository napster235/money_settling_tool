# frozen_string_literal: true

class Participant < ApplicationRecord
  require 'csv'
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  default_scope { order(created_at: :desc) }

  has_and_belongs_to_many :bills

  belongs_to :user, optional: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Participant.create! row.to_hash
    end
  end

  def name_with_initial
    "Participant name: #{first_name} #{last_name}"
  end

  def cost_per_bill
    "%.2f" % self.bills.map { |b| b.get_cost_per_participant.to_f }.sum.round(2)
  end
end
