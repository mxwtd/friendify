class AddActivityToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :activity, null: false, foreign_key: true
  end
end
