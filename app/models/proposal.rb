class Proposal < ApplicationRecord
  belongs_to :offer
  belongs_to :developer

  validates :price, :details, presence: true
  validates :estimated_date, presence: true
  #, less_than_or_equal_to: self.offer.target_date
  validates :status, inclusion: { in: %w[pending accepted rejected]}
  validates_numericality_of :price, :greater_than => 0.0
end
