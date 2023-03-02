class RemoveFriendFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :friend_id
  end
end
