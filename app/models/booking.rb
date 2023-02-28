class Booking < ApplicationRecord
  belongs_to :friend
  belongs_to :user
  validates :comment, presence: true
end
