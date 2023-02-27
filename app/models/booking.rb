class Booking < ApplicationRecord
  belongs_to :friends
  belongs_to :user
end
