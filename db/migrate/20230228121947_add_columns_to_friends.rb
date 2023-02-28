class AddColumnsToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :name, :string
    add_column :friends, :age, :integer
    add_column :friends, :email, :string
  end
end
