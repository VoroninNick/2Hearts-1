class AddBannerToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.attachment :banner
      t.string :youtube_video_id
    end

    change_table :project_translations do |t|
      t.string :youtube_video_id
    end
  end
end
