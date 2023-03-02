class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.text :description
      t.text :location
      t.boolean :is_friend
      t.decimal :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
