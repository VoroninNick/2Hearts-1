class AddSortingPositionToPages < ActiveRecord::Migration
  def up
    add_column :pages, :sorting_position, :integer if !column_exists?(:pages, :sorting_position)
  end

  def down
    remove_column :pages, :sorting_position
  end
end
