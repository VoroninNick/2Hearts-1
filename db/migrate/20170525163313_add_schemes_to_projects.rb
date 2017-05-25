class AddSchemesToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.string :task_images_scheme
      t.string :idea_and_solution_images_scheme
      t.string :result_images_scheme
      t.string :project_feedbacks_scheme
    end
  end
end
