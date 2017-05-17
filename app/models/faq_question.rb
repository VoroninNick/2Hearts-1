class FaqQuestion < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :url_fragment, :content

  boolean_scope :published
  scope :order_by_sorting_position, -> { order("sorting_position asc") }

  default_scope do
    order_by_sorting_position
  end

  has_cache do
    pages :faq
  end

  def url(locale = I18n.locale)
    url_fragment = self.translations_by_locale[locale].try(:url_fragment)
    return nil if url_fragment.blank?
    base_url = Pages.faq.url
    base_url + "#" + url_fragment
  end
end
