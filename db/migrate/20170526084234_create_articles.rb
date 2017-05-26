class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.boolean :published
      t.datetime :release_date

      t.integer :article_category_id

      t.string :name
      t.string :url_fragment
      t.text :short_description
      t.text :content

      t.attachment :avatar

      t.timestamps null: false
    end

    Article.create_translation_table(:name, :url_fragment, :short_description, :content)
  end

  def down
    Article.drop_translation_table!

    drop_table :articles
  end
end
