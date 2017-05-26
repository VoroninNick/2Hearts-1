class Service < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :url_fragment, :short_description, :quote_text, :content

  boolean_scope :published
  scope :order_by_sorting_position, -> { order("sorting_position asc") }

  default_scope do
    order_by_sorting_position
  end

  has_cache do
    pages :home, :services
  end

  image :icon
  image :small_title_image
  image :large_title_image

  has_images :images, **IMAGE_OPTIONS

  def url(locale = I18n.locale)
    url_fragment = self.translations_by_locale[locale].try(:url_fragment)
    return nil if url_fragment.blank?
    base_url = Pages.services.url
    base_url + "#" + url_fragment
  end

  def small_title_image_path
    number = index_of(self.class.published) + 1
    "svg/services/#{number}-small_title.svg"
  end

  def large_title_image_path
    number = index_of(self.class.published) + 1
    "svg/services/#{number}-large_title.svg"
  end
end
