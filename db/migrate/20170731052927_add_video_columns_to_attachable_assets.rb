class AddVideoColumnsToAttachableAssets < ActiveRecord::Migration
  def change
    change_table :assets do |t|
      t.string :youtube_video_id
      t.string :vimeo_video_id
    end

    change_table :asset_translations do |t|
      t.string :youtube_video_id
      t.string :vimeo_video_id
    end
  end
end
