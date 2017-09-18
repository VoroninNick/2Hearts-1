class Pages::Contacts < Cms::Page
  include Cms::LocalizedRoutes::UrlHelper::ActiveRecordExtension

  def self.default_change_freq
    :yearly
  end
end