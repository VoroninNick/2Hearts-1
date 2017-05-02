class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]

  self.layout "home"

  def index
  #   set_page_metadata(:home)
  end

  def about

  end

  def services

  end

  def blog

  end

  def blog_one

  end

  def projects

  end

  def project_one

  end

  def faq

  end

  def contact_us

  end

  def vacancies

  end
  
  private

  def set_page_instance
  #   set_page_metadata(action_name)
  end
end