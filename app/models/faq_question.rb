class FaqQuestion < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :url_fragment, :content
end
