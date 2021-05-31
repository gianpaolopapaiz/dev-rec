class Developer < ApplicationRecord
  has_many :proposals
  has_many :offers, through: :proposals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :skills, :years_experience, :github_url, :age, presence: true
  validates :name, uniqueness: true
end
