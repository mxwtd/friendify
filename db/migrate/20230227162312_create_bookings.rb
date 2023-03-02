class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :friend, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :comment
      t.date :date

      t.timestamps
    end
  end
end
