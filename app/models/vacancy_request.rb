class VacancyRequest < ActiveRecord::Base
  attr_accessible *attribute_names

  include Cms::Notifier

  belongs_to :vacancy
  attr_accessible :vacancy

  image :attachment

  validates_presence_of :name, :phone, :email

  extend Cms::FormAttributesHelper

  def self.fields_from_model
    self.form_attributes(true)
  end
end
