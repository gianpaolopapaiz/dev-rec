class Rating < ApplicationRecord
  belongs_to :customer
  belongs_to :developer

  validates :rating, :inclusion => 1..5
end
