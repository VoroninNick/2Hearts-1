class CreateHomeSlides < ActiveRecord::Migration
  def up
    create_table :home_slides do |t|
      t.boolean :published
      t.integer :sorting_position

      t.attachment :image
      t.string :image_alt
      t.text :message
      t.string :author_name
      t.string :author_description

      t.timestamps null: false
    end

    HomeSlide.create_translation_table(:image_alt, :message, :author_name, :author_description)
  end

  def down
    HomeSlide.drop_translation_table!

    drop_table :home_slides
  end
end
