class HomeSlide < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :image_alt, :message, :author_name, :author_description

  boolean_scope :published
  scope :order_by_sorting_position, -> { order("sorting_position asc") }

  default_scope do
    order_by_sorting_position
  end

  has_cache do
    pages :home
  end

  image :image, styles: {xl: "2048x820#"}
end
