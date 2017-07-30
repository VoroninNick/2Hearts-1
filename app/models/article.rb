class Article < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :url_fragment, :short_description, :content

  boolean_scope :published
  scope :order_by_date, -> { order("release_date desc") }

  default_scope do
    order_by_date
  end

  belongs_to :article_category
  attr_accessible :article_category

  has_seo_tags
  has_sitemap_record
  has_cache do
    pages :blog, Article.published, self
  end

  image :avatar, styles: { large: "945x580#", medium: "460x280#" }

  has_navigation

  def url(locale = I18n.locale)
    self.class.base_url + "/" + self.translations_by_locale[locale].try(:url_fragment)
  end

  def self.base_url(locale = I18n.locale)
    Cms.url_helpers.send("blog_#{locale}_path")
  end

  def formatted_release_date(format = :short)
    d = release_date
    return nil if d.nil?
    if format == :short
      d.strftime("%d.%m.%Y")
    elsif format == :long
      month_name = I18n.t("genitive_month_names")[d.month - 1]
      "#{d.day} #{month_name} #{d.year}"
    end
  end

  def category_name
    s = article_category.try(:name)
    if s.blank?
      s = I18n.t("components.tags.misc", raise: true) rescue "misc"
    end

    s
  end

  def self.get(url_fragment)
    self.published.joins(:translations).where(:"#{self.translation_class.table_name}" => { url_fragment: url_fragment, locale: I18n.locale }).first
  end

  def like
    c = self.likes_count
    c += 1
    self.likes_count = c
  end

  def like!
    self.like
    self.save
  end

  def likes_count
    self["likes_count"] || 0
  end
end
