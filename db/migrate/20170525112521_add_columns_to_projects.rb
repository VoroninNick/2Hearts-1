class AddColumnsToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.text :technical_support
      t.string :special_effects
      t.string :photo_and_video
      t.string :show_program
      t.string :candy_bar
    end

    change_table :project_translations do |t|
      t.text :technical_support
      t.string :special_effects
      t.string :photo_and_video
      t.string :show_program
      t.string :candy_bar
    end
  end
end
