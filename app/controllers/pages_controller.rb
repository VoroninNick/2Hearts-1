class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]

  def index
  #   set_page_metadata(:home)
  end

  def about

  end

  def services

  end

  def faq

  end

  def contact_us

  end

  def vacancies
    @vacancies = Vacancy
  end

  def private_policy
  
  end

  def set_page_instance
  #   set_page_metadata(action_name)
  end
end