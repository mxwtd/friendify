class Activity < ApplicationRecord  
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
end
