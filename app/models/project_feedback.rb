class ProjectFeedback < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :short_description, :message

  boolean_scope :published

  has_cache do
    pages self.project
  end


  belongs_to :project
  attr_accessible :project

  image :image
end
