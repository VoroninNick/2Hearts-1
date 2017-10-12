class ProjectFeedback < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :short_description, :message

  boolean_scope :published
  scope :most_recent, ->{ published.order("created_at desc").limit(10) }

  has_cache do
    pages :home, self.project
  end


  belongs_to :project
  attr_accessible :project

  image :image, **IMAGE_OPTIONS

end
