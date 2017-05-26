class ArticleCategory < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :url_fragment

  scope :order_by_sorting_position, -> { order("sorting_position asc") }

  default_scope do
    order_by_sorting_position
  end

  has_many :articles
  attr_accessible :articles, :article_ids



  has_cache do
    pages :blog, Article.published
  end

  def url(locale = I18n.locale)
    url_fragment = self.translations_by_locale[locale].try(:url_fragment)
    return nil if url_fragment.blank?
    base_url = Pages.blog.url
    base_url + "#" + url_fragment
  end

  def articles_count
    articles.published.count
  end
end
