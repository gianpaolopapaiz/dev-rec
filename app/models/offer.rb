class Offer < ApplicationRecord
  belongs_to :customer
  has_many :proposals, dependent: :destroy
  has_many :developers, through: :proposals
  
  validates :description, :target_date, :open, :title, presence: :true

end
