class ProjectsController < ApplicationController
  caches_page :index, :show

  def index
    @projects = Project.published
    @categories = ProjectCategory.joins(projects: {}).where(projects: {published: 't'}).uniq
    @other_projects_count = Project.published.where("project_category_id is null").count
    @show_other_category = @other_projects_count > 0
    @all_count = @projects.count
    @show_all = (@show_other_category && @categories.count > 0) || (@categories.count > 1)
    set_page_metadata(:projects)
  end

  def show
    @project = Project.get(params[:id])
    if @project.nil?
      return render_not_found
    end
    set_page_metadata(@project)
    @related_projects = Project.published.where.not(id: @project.id)
    @og_image = @project.avatar.url
  end
end