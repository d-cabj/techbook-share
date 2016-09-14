class AddItemsCountToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :items_count, :integer, default: 0
  end
end
