class Proposal < ApplicationRecord
  belongs_to :offer
  belongs_to :dev
end
