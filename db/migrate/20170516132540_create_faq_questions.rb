class CreateFaqQuestions < ActiveRecord::Migration
  def up
    create_table :faq_questions do |t|
      t.string :name
      t.string :url_fragment
      t.text :content
      t.boolean :published
      t.integer :sorting_position

      t.timestamps null: false
    end

    FaqQuestion.create_translation_table(:name, :url_fragment, :content)
  end

  def down
    FaqQuestion.drop_translation_table!

    drop_table :faq_questions
  end
end
