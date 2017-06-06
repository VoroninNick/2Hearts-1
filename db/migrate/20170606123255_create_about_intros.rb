class CreateAboutIntros < ActiveRecord::Migration
  def up
    create_table :about_intros do |t|
      t.text :intro
      t.attachment :image

      t.timestamps null: false
    end

    AboutIntro.create_translation_table(:intro)
  end

  def down
    AboutIntro.drop_translation_table!

    drop_table :about_intros
  end
end
