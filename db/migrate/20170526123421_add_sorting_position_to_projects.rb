class AddSortingPositionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :sorting_position, :integer
  end
end
