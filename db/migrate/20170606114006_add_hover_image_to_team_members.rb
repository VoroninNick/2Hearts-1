class AddHoverImageToTeamMembers < ActiveRecord::Migration
  def change
    change_table :team_members do |t|
      t.attachment :hover_image
    end
  end
end
