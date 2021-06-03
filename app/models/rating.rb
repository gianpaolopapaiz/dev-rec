class Rating < ApplicationRecord
  belongs_to :customer
  belongs_to :developer
end
