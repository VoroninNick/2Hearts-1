class CreateProjects < ActiveRecord::Migration
  def up
    create_table :projects do |t|
      t.integer :project_category_id
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

      t.text :idea_and_solution_quote_text
      t.string :idea_and_solution_quote_author

      t.text :task_text
      t.text :idea_and_solution_text
      t.text :result_text

      t.attachment :result_banner
      t.attachment :idea_and_solution_banner

      t.string :featured_member_name
      t.string :featured_member_short_description
      t.attachment :featured_member_avatar

      t.string :instagram_hash_tag



      t.timestamps null: false
    end

    Project.create_translation_table(:name, :url_fragment, :address, :idea_and_organization, :coordination, :decor, :music, :task_text, :idea_and_solution_text, :idea_and_solution_quote_text, :idea_and_solution_quote_author, :result_text, :featured_member_name, :featured_member_short_description)
  end

  def down
    Project.drop_translation_table!

    drop_table :projects
  end
end
