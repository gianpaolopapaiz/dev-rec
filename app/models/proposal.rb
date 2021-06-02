class Proposal < ApplicationRecord
  belongs_to :offer
  belongs_to :developer

  validates :price, :estimated_date, :details, presence: true
  validates :status, inclusion: { in: %w[pending accepted rejected]}
  validates_numericality_of :price, :greater_than => 0.0
end
