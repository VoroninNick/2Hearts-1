class ProjectsController < ApplicationController
  def index
    @projects = Project.published
    @categories = ProjectCategory.joins(projects: {})
    @other_projects_count = Project.published.where("project_category_id is null").count
    @show_other_category = @other_projects_count > 0
    @all_count = @projects.count
    @show_all = (@show_other_category && @categories.count > 0) || (@categories.count > 1)
  end

  def show
    @project = Project.first
  end
end