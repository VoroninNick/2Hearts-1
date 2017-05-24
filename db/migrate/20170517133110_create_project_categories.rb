class CreateProjectCategories < ActiveRecord::Migration
  def up
    create_table :project_categories do |t|
      t.integer :sorting_position
      t.string :name
      t.string :url_fragment
      t.string :item_category_name
      t.string :color

      t.timestamps null: false
    end

    ProjectCategory.create_translation_table(:name, :url_fragment, :item_category_name)
  end

  def down
    ProjectCategory.drop_translation_table!

    drop_table :project_categories
  end
end
