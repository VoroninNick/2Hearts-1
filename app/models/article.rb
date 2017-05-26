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

  has_cache do
    pages :blog, Article.published
  end

  image :avatar

  has_navigation


end
