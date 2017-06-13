class CreateVacancyRequests < ActiveRecord::Migration
  def change
    create_table :vacancy_requests do |t|
      t.integer :vacancy_id
      t.string :name
      t.string :phone
      t.string :email
      t.attachment :attachment
      t.text :comment

      t.string :referer
      t.string :session_id

      t.timestamps null: false
    end
  end
end
