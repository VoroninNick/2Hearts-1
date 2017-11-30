class AddTypeToProjects < ActiveRecord::Migration
  def up
    add_column :projects, :type, :string
    Project.update_all(type: "Wedding")
  end

  def down
    remove_column :projects, :type, :string
  end
end
