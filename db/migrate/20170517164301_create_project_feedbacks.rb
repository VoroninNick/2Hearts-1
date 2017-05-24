class CreateProjectFeedbacks < ActiveRecord::Migration
  def up
    create_table :project_feedbacks do |t|
      t.string :project_id
      t.string :name
      t.string :short_description
      t.text :message
      t.string :url
      t.attachment :image
      t.boolean :published

      t.timestamps null: false
    end

    ProjectFeedback.create_translation_table(:name, :short_description, :message)
  end

  def down
    ProjectFeedback.drop_translation_table!

    drop_table :project_feedbacks
  end
end
