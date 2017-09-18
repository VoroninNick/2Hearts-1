class Pages::Faq < Cms::Page
  include Cms::LocalizedRoutes::UrlHelper::ActiveRecordExtension

  def self.default_priority
    0.6
  end
end