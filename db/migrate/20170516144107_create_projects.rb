class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.boolean :published
      t.date :release_date
      t.attachment :avatar
      t.string :name
      t.string :url_fragment
      t.string :address
      t.integer :guests_count
      t.string :idea_and_organization
      t.string :coordination
      t.string :decor
      t.string :music

      t.text :step1_text
      t.text :step2_text
      t.text :step3_text



      t.timestamps null: false
    end
  end
end
