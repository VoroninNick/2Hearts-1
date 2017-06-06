class Partner < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :site_url

  boolean_scope :published
  scope :order_by_sorting_position, -> { order("sorting_position asc") }

  default_scope do
    order_by_sorting_position
  end

  has_cache do
    pages :about_us
  end

  image :icon
end
