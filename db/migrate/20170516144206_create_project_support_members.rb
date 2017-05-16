class CreateProjectSupportMembers < ActiveRecord::Migration
  def change
    create_table :project_support_members do |t|
      t.string :name
      t.string :category

      t.timestamps null: false
    end
  end
end
