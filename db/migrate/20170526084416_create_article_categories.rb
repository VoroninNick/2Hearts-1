class CreateArticleCategories < ActiveRecord::Migration
  def up
    create_table :article_categories do |t|
      t.integer :sorting_position

      t.string :name
      t.string :url_fragment

      t.timestamps null: false
    end

    ArticleCategory.create_translation_table(:name, :url_fragment)
  end

  def down
    drop_table :article_categories

    ArticleCategory.drop_translation_table!
  end
end
