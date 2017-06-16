class AddSortingPositionToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :sorting_position, :integer
  end
end
