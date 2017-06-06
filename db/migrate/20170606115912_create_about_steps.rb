class CreateAboutSteps < ActiveRecord::Migration
  def up
    create_table :about_steps do |t|
      t.boolean :published
      t.integer :sorting_position
      t.attachment :icon
      t.string :title_part1
      t.string :title_part2
      t.string :subtitle
      t.text :description

      t.timestamps null: false
    end

    AboutStep.create_translation_table(:title_part1, :title_part2, :subtitle, :description)
  end

  def down
    AboutStep.drop_translation_table!

    drop_table :about_steps
  end
end
