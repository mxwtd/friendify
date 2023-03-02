class AddCategoryToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :category, :string
  end
end
