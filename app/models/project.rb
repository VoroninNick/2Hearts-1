class Project < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :url_fragment, :address, :idea_and_organization, :coordination, :decor, :music, :task_text, :idea_and_solution_text, :idea_and_solution_quote_text, :idea_and_solution_quote_author, :result_text, :featured_member_name, :featured_member_short_description

  boolean_scope :published

  has_cache do
    pages :projects, Project.published
  end

  belongs_to :project_category
  attr_accessible :project_category

  has_many :project_feedbacks
  attr_accessible :project_feedbacks, :project_feedback_ids

  image :avatar
  image :featured_member_avatar, styles: {thumb: "100x100#"}
  image :idea_and_solution_banner, styles: {xxl: "1920x1080#"}
  image :result_banner, styles: {xxl: "1920x1080#", small: "640x1024#"}
  image :result_banner_mobile, styles: { small: "640x1024#" }


  has_images :task_images
  has_images :idea_and_solution_images
  has_images :result_images

  def category
    project_category
  end

  def category_svg_icon_string
    category.svg_icon_string
  end

  def category_name
    category.name
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
end
