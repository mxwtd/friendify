class AddPhotoToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :photo, :string
  end
end
