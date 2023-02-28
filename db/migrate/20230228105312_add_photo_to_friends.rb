class AddPhotoToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :photo_url, :string
  end
end
