class CreateFaqQuestionRequests < ActiveRecord::Migration
  def change
    create_table :faq_question_requests do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :comment

      t.string :referer
      t.string :session_id

      t.timestamps null: false
    end
  end
end
