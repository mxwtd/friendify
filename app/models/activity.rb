class Activity < ApplicationRecord  
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
end
