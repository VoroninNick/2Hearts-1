class AboutTeamIntro < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :intro


  has_cache do
    pages :about_us
  end
end
