class AddVimeoVideoIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :vimeo_video_id, :string
    add_column :project_translations, :vimeo_video_id, :string
  end
end
