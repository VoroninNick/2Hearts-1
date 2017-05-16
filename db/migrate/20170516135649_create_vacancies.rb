class CreateVacancies < ActiveRecord::Migration
  def up
    create_table :vacancies do |t|
      t.string :name
      t.string :url_fragment
      t.string :short_description
      t.text :content
      t.boolean :published
      t.integer :sorting_position

      t.timestamps null: false
    end

    Vacancy.create_translation_table(:name, :url_fragment, :short_description, :content)
  end

  def down
    Vacancy.drop_translation_table!

    drop_table :vacancies
  end
end
