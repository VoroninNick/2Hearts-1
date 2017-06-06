class CreateAboutTeamIntros < ActiveRecord::Migration
  def up
    create_table :about_team_intros do |t|
      t.text :intro

      t.timestamps null: false
    end

    AboutTeamIntro.create_translation_table(:intro)
  end

  def down
    AboutTeamIntro.drop_translation_table!

    drop_table :about_team_intros
  end
end
