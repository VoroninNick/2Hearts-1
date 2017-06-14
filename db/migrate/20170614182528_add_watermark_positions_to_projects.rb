class AddWatermarkPositionsToProjects < ActiveRecord::Migration
  def change
    [:avatar, :idea_and_solution_banner, :result_banner, :banner].each do |k|
      add_column :projects, :"#{k}_watermark_position", :string
    end
  end
end
