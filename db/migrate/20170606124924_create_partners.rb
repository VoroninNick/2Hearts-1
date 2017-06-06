class CreatePartners < ActiveRecord::Migration
  def up
    create_table :partners do |t|
      t.boolean :published
      t.integer :sorting_position
      t.string :name
      t.string :site_url
      t.attachment :icon

      t.timestamps null: false
    end

    Partner.create_translation_table(:name, :site_url)
  end

  def down
    Partner.drop_translation_table!

    drop_table :partners
  end
end
