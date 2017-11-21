class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]
  caches_page :index, :about_us, :services, :faq, :contacts, :vacancies, :privacy_policy

  def index
    set_page_metadata(:home)
    @services = Service.published
    @projects = Project.published
    @home_slides = HomeSlide.published
    @features = I18n.t("home.why-we.features")
    @team_members = TeamMember.published.featured
    @feedbacks = ProjectFeedback.most_recent
    #@about_team_intro = AboutTeamIntro.first
    @about_intro = AboutIntro.first

  end

  def about_us
    @team_members = TeamMember.published
    @about_steps = AboutStep.published
    @about_intro = AboutIntro.first
    @about_team_intro = AboutTeamIntro.first
    @partners = Partner.published
  end

  def services
    @services = Service.published
  end

  def events

  end

  def event_one

  end

  def faq
    @faq_questions = FaqQuestion.published
  end

  def contacts
    @contact_info = ContactInfo.first_or_initialize
    @featured_vacancies = Vacancy.featured
    @extra_vacancies_count = Vacancy.published.count - 4
    @extra_vacancies_count_text = nil
    if @extra_vacancies_count > 0
      word_forms = {one: "Вакансія", few: "Вакансії", other: "Вакансій"}
      word_form_key = :other
      n = @extra_vacancies_count
      if n == 1
        word_form_key = :one
      elsif n >= 2 && n <= 4
        word_form_key = :few
      end

      word_form = word_forms[word_form_key]

      @extra_vacancies_count_text = "+#{n} &nbsp;#{word_form}"
    end
  end

  def vacancies
    @vacancies = Vacancy.published
  end

  def privacy_policy
  
  end

  def not_found
    @render_header = false
    @render_footer = false
  end

  def set_page_instance
    set_page_metadata(action_name)
    @_locale_links ||= {}
    Cms.config.provided_locales.each do |locale|
      @_locale_links[locale.to_sym] = send("#{action_name}_#{I18n.locale}_path")
    end
  end
end