class Friend < ApplicationRecord  
  belongs_to :user
  has_many :bookings

  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :email, presence: true
end
