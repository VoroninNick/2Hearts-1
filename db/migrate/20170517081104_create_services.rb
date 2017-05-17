class CreateServices < ActiveRecord::Migration
  def up
    create_table :services do |t|
      t.boolean :published
      t.integer :sorting_position
      t.string :name
      t.string :url_fragment
      t.text :short_description
      t.text :content
      t.text :quote_text

      t.timestamps null: false
    end

    Service.create_translation_table(:name, :url_fragment, :short_description, :quote_text, :content)
  end

  def down
    Service.drop_translation_table!

    drop_table :services
  end
end
