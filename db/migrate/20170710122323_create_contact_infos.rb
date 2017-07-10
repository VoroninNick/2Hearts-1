class CreateContactInfos < ActiveRecord::Migration
  def up
    create_table :contact_infos do |t|
      t.text :phones
      t.text :emails
      t.string :address
      t.string :contact_images_scheme
      t.text :vacancies_text

      t.timestamps null: false
    end

    ContactInfo.create_translation_table(:phones, :emails, :address, :vacancies_text)
  end

  def down
    ContactInfo.drop_translation_table

    drop_table :contact_infos
  end
end
