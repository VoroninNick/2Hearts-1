class Pages::Blog < Cms::Page
  include Cms::LocalizedRoutes::UrlHelper::ActiveRecordExtension

  def self.default_change_freq
    :weekly
  end
end