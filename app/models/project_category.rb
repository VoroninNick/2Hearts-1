class ProjectCategory < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :url_fragment, :item_category_name

  scope :order_by_sorting_position, -> { order("sorting_position asc") }

  has_many :projects
  attr_accessible :projects, :project_ids

  default_scope do
    order_by_sorting_position
  end

  has_cache do
    pages :projects, Project.published
  end

  def url(locale = I18n.locale)
    url_fragment = self.translations_by_locale[locale].try(:url_fragment)
    return nil if url_fragment.blank?
    base_url = Pages.projects.url
    base_url + "#" + url_fragment
  end

  def svg_icon_string
    style = {fill: color, stroke: stroke_color}.keep_if{|k, v| v.present? }
    style_str = style.map{|k, v| "#{k}:#{v}" }.join(";")

    Cms::Helpers::ImageHelper.self_embedded_svg_from_assets("svg/2h-little-heart-01.svg", style: style_str )
  end

  def projects_count
    projects.published.count
  end
end
