class ContactInfo < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :phones, :emails, :address, :vacancies_text

  has_images :contact_images, **IMAGE_OPTIONS

  has_cache do
    pages :contacts
  end

  before_save :init_schemes

  def init_schemes
    h = {contact_images_scheme: 1}
    h.each do |k, v|
      val = self.send(k)
      if val.blank?
        self.send("#{k}=", v)
      end
    end

    true
  end

  def contact_images_scheme
    v = self['contact_images_scheme']
    v = 1 if v.blank?

    v
  end

  include Cms::TextFields
  def phones
    properties_field(:phones, I18n.locale, true)
  end

  def emails
    properties_field(:emails, I18n.locale, true)
  end


end
