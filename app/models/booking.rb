class Booking < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  validates :comment, presence: true
end
