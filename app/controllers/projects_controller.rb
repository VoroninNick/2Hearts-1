class ProjectsController < ApplicationController
  caches_page :index, :show
  before_action :set_project, only: [:show]

  def index
    @projects = resource_class.published
    @categories = ProjectCategory.joins(projects: {}).where(projects: {published: 't', type: resource_class_name}).uniq
    @other_projects_count = resource_class.published.where("project_category_id is null").count
    @show_other_category = @other_projects_count > 0
    @all_count = @projects.count
    @show_all = (@show_other_category && @categories.count > 0) || (@categories.count > 1)
    set_page_metadata(resource_name_plural)
  end

  def show
    set_page_metadata(@project)
    @related_projects = resource_class.published.where.not(id: @project.id)
    @og_image = @project.avatar.url
  end

  def set_project
    @project = resource_class.get(params[:id])
    if @project.nil?
      render_not_found
    end
  end

  def resource_name
    controller_name.singularize
  end

  def order_type
    "#{resource_class_name}OrderRequest"
  end

  def resource_name_plural
    controller_name
  end

  def resource_class_name
    resource_name.classify
  end

  def resource_class
    resource_class_name.constantize
  end

  def resource_i18n_root
    "projects"
  end

  helper_method :resource_i18n_root, :order_type
end