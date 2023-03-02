class RenameFriendsToActivities < ActiveRecord::Migration[7.0]
  def change
    rename_table :friends, :activities
  end
end
