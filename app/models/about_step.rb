class AboutStep < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :title_part1, :title_part2, :subtitle, :description

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
