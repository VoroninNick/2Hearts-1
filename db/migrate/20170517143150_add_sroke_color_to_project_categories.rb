class AddSrokeColorToProjectCategories < ActiveRecord::Migration
  def change
    add_column :project_categories, :stroke_color, :string
  end
end
