class Project < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :url_fragment, :address, :idea_and_organization, :coordination, :decor, :music, :task_text, :idea_and_solution_text, :idea_and_solution_quote_text, :idea_and_solution_quote_author, :result_text, :featured_member_name, :featured_member_short_description, :technical_support, :special_effects, :photo_and_video, :show_program, :candy_bar

  boolean_scope :published

  has_cache do
    pages :projects, Project.published
  end

  has_navigation

  belongs_to :project_category
  attr_accessible :project_category

  has_many :project_feedbacks
  attr_accessible :project_feedbacks, :project_feedback_ids

  image :avatar
  image :featured_member_avatar, styles: {thumb: "100x100#"}
  image :idea_and_solution_banner, styles: {xxl: "1920x1080#"}
  image :result_banner, styles: {xxl: "1920x1080#", small: "640x1024#"}
  image :result_banner_mobile, styles: { small: "640x1024#" }


  has_images :task_images, styles: { large: "1380x700#", square: "450x450#", wide: "900x450#", medium_square: "680x680#", medium_tall: "680x1040#", small_wide: "680x360", small_square: "330x330#" }
  has_images :idea_and_solution_images
  has_images :result_images

  def category
    project_category
  end

  def category_svg_icon_string
    category.svg_icon_string
  end

  def category_name
    category.item_category_name
  end

  def guests_count_string
    n = guests_count

    if n > 0
      word_forms = {one: "Гість", few: "Гостя", other: "Гостей"}
      n_by_10 = n % 10
      word_form_key = :other
      if n_by_10 % 10 == 1
        word_form_key = :one
      elsif n_by_10 >= 2 && n_by_10 <= 4
        word_form_key = :few
      end

      word_form = word_forms[word_form_key]

      return "#{n} #{word_form}"
    end

    nil
  end

  def self.get(url_fragment)
    self.published.joins(:translations).where(project_translations: { url_fragment: url_fragment, locale: I18n.locale }).first
  end

  def formatted_release_date
    d = release_date
    return nil if d.nil?
    d.strftime("%d.%m.%Y")
  end

  def formatted_technical_support
    s = technical_support
    return nil if s.blank?
    lines = s.split("\r\n").select(&:present?)
    lines.map{|line|
      opening_bracket_index = line.index("(")
      if opening_bracket_index && opening_bracket_index >= 0
        label = line[opening_bracket_index..line.length]
        value = line[0..(opening_bracket_index-1)]
        next "#{value}&nbsp;<span>#{label}</span>"
      else
        next line
      end
    }
  end
end