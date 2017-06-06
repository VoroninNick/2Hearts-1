class AboutIntro < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :intro


  has_cache do
    pages :about_us
  end

  image :image
end
