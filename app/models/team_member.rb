class TeamMember < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :position

  boolean_scope :published
  boolean_scope :featured
  scope :order_by_sorting_position, -> { order("sorting_position asc") }

  default_scope do
    order_by_sorting_position
  end

  has_cache do
    pages :home, :about_us
  end

  image :image, styles: {medium: "440x620#"}
end
