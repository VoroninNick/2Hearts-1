class AddCateringToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :catering, :string
    add_column :project_translations, :catering, :string

    add_column :projects, :narrator, :string
    add_column :project_translations, :narrator, :string
  end
end
