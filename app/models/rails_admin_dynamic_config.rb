def scheme_enum_field(name)
  field name, :enum do
    enum do
      [["1 (6 images)", "1"], ["2 (4 images)", "2"], ["3 (5 images)", "3"], ["4 (10 images)", "4"], ["5 (6 images)", "5"], ["6 (1 image)", "6"], ["7 (7 images)", "7"], ["8 (3 images)", "8"]]
    end
  end
end

def show_if_wedding
  visible do
    if r = @bindings[:object].try(:resource)
      next r.is_a?(Wedding)
    end
    @bindings[:controller].instance_variable_get(:@model_name) == "Wedding"
  end
end


module RailsAdminDynamicConfig
  class << self
    def configure_rails_admin(initial = true)
      RailsAdmin.config do |config|

        ### Popular gems integration

        ## == Devise ==
        config.authenticate_with do
          warden.authenticate! scope: :user
        end
        config.current_user_method(&:current_user)

        ## == Cancan ==
        #config.authorize_with :cancan

        ## == Pundit ==
        # config.authorize_with :pundit

        ## == PaperTrail ==
        # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

        ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration



        if initial
          config.actions do
            dashboard                     # mandatory
            index                         # mandatory
            new do
              #except [CallRequest, ConsultationRequest, MeterRequest, ContactsRequest, PartnershipRequest]
            end
            export
            bulk_delete
            show
            edit
            delete
            show_in_app
            props do
              only []
            end
            #edit_model
            nestable do
              only [Cms::Page, Vacancy, FaqQuestion, Service, Project, ProjectCategory, HomeSlide, TeamMember]
            end

            ## With an audit adapter, you can add:
            # history_index
            # history_show
          end
        end

        config.navigation_labels do
          {
            feedbacks: 100,
            home: 200,
            about_us: 300,
            projects: 400,
            services: 500,
            blog: 600,
            faq: 700,
            contacts: 800,
            vacancies: 900,
            tags: 1000,
            users: 1100,
            settings: 1200,
            pages: 1300,
            assets: 1400
          }
        end

        config.navigation_static_links = {
           mailchimp: "/admin/mailchimp",
           locales: "/file_editor/locales",
           site_data: "/file_editor/site_data.yml"
        }

        config.include_models Attachable::Asset


        #
        #
        config.include_models Cms::SitemapElement, Cms::MetaTags
        config.include_models Cms::Page
        config.model Cms::Page do
          navigation_label_key(:pages, 1)
          nestable_list({position_field: :sorting_position, scope: :order_by_sorting_position})
          object_label_method do
            :custom_name
            #{
            #k = @bindings[:object].type.underscore.split("/").last
            #I18n.t("activerecord.models.pages.#{k}", raise: true) rescue k.humanize
            #}
          end
          list do
            sort_by do
              "sorting_position"
            end

            field :name do
              def value
                k = @bindings[:object].type.underscore.split("/").last
                I18n.t("activerecord.models.pages.#{k}", raise: true) rescue k.humanize
              end
            end

            field :h1_text do
              def value
                @bindings[:object].h1_text
              end
            end
          end

          edit do
            field :name do
              read_only true
              def value
                k = @bindings[:object].type.underscore.split("/").last
                I18n.t("activerecord.models.pages.#{k}", raise: true) rescue k.humanize
              end
            end
            field :translations, :globalize_tabs
            field :seo_tags

          end

        end

        config.model_translation Cms::Page do
          field :locale, :hidden
          field :h1_text
        end


        config.model Cms::MetaTags do
          visible false
          field :translations, :globalize_tabs
        end

        config.model_translation Cms::MetaTags do
          field :locale, :hidden
          field :title
          field :keywords
          field :description
        end


        config.model Cms::SitemapElement do
          visible false

          field :display_on_sitemap
          field :changefreq
          field :priority
        end

        config.include_models Attachable::Asset

        config.model Attachable::Asset do
          navigation_label_key(:assets, 1)
          field :data
          watermark_position_field(:data)
          field :sorting_position
          field :translations, :globalize_tabs
        end

        config.model_translation Attachable::Asset do
          field :locale, :hidden
          field :data_alt
          field :youtube_video_id
          field :vimeo_video_id
        end


        config.include_models User
        config.model User do
          navigation_label_key(:users, 1)
          field :email
          field :password
          field :password_confirmation
        end

        config.include_models Cms::Tag, Cms::Tagging

        config.model Cms::Tag do
          navigation_label_key(:tags, 1)
          field :translations, :globalize_tabs
          field :blog_articles
        end

        config.model_translation Cms::Tag do
          field :locale, :hidden
          field :name
          field :url_fragment do
            help do
              I18n.t("admin.help.#{name}")
            end
          end
        end

        config.model Cms::Tagging do
          visible false
        end

        # ===================================================
        # Requests
        # ===================================================
        config.configure_forms(ContactRequest, FaqQuestionRequest, OrderRequest, EventOrderRequest, WeddingOrderRequest, VacancyRequest)

        # ===================================================
        # Application specific models
        # ===================================================
        config.include_models Vacancy, FaqQuestion, Service, Project, ProjectCategory, ProjectFeedback, HomeSlide, TeamMember, AboutIntro, AboutStep, AboutTeamIntro, Partner, ArticleCategory, Article, ContactInfo
        config.model Vacancy do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :vacancies, 1

          field :published
          field :translations, :globalize_tabs
        end

        config.model_translation Vacancy do
          field :locale, :hidden
          field :name
          field :url_fragment
          field :short_description
          field :content, :ck_editor
        end

        config.model FaqQuestion do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :faq, 1

          field :published
          field :translations, :globalize_tabs
        end

        config.model_translation FaqQuestion do
          field :locale, :hidden
          field :name
          field :url_fragment
          field :content, :ck_editor
        end

        config.model Service do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :services, 1

          field :published
          field :icon do
            svg_icon_pretty_value
          end
          field :translations, :globalize_tabs
          field :images
          scheme_enum_field(:images_scheme)
        end

        config.model_translation Service do
          field :locale, :hidden
          field :name
          field :url_fragment
          field :short_description
          field :quote_text
          field :content, :ck_editor
        end

        [Project, Event, Wedding].each do |m|
          config.model m do
            navigation_label_key :projects, 1
            nestable_list({position_field: :sorting_position})

            group :basic do
              field :published
              field :project_category
              field :instagram_hash_tag
              field :release_date, :date do
                date_format do
                  :default
                end
              end
              field :banner
              watermark_position_field(:banner)
              field :avatar do
                svg_icon_pretty_value
              end
              watermark_position_field(:avatar)
              field :translations, :globalize_tabs
              field :seo_tags
            end

            group :summary do
              field :guests_count
            end

            group :featured_member do
              field :featured_member_avatar do
                svg_icon_pretty_value
              end
            end

            group :task do
              field :task_images
              scheme_enum_field(:task_images_scheme)
            end

            group :idea_and_solution do
              show_if_wedding

              field :idea_and_solution_images
              scheme_enum_field(:idea_and_solution_images_scheme)
              field :idea_and_solution_banner do
                svg_icon_pretty_value
              end
              watermark_position_field(:idea_and_solution_banner)
            end

            group :result do
              show_if_wedding

              field :result_images
              scheme_enum_field(:result_images_scheme)
              field :result_banner do
                svg_icon_pretty_value
              end
              watermark_position_field(:result_banner)
              field :result_banner_mobile do
                svg_icon_pretty_value
              end
            end

            group :feedbacks do
              field :likes_count do
                read_only true
                def value
                  @bindings[:object].likes_count
                end
              end
              scheme_enum_field(:project_feedbacks_scheme)
            end

            group :seo do
              field :seo_tags
            end

          end
        end

        config.model_translation Project do
          field :locale, :hidden
          group :basic do
            field :name
            field :url_fragment
            field :youtube_video_id
            field :vimeo_video_id
          end

          group :summary do
            field :idea_and_organization
            field :catering
            field :narrator
            field :coordination
            field :decor
            field :music
            field :address
            field :technical_support
            field :special_effects
            field :photo_and_video
            field :show_program
            field :candy_bar
          end

          group :featured_member do
            field :featured_member_name
            field :featured_member_short_description
          end

          group :task do
            field :task_text, :ck_editor
          end

          group :idea_and_solution do
            field :idea_and_solution_text, :ck_editor do
              show_if_wedding
            end
            field :idea_and_solution_quote_text do
              show_if_wedding
            end
            field :idea_and_solution_quote_author do
              show_if_wedding
            end
          end

          group :result do
            field :result_text, :ck_editor do
              show_if_wedding
            end
          end
        end

        config.model ProjectCategory do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :projects, 2

          field :translations, :globalize_tabs
          field :color
          field :stroke_color
        end

        config.model_translation ProjectCategory do
          field :locale, :hidden
          field :name
          field :url_fragment
          field :item_category_name

        end

        config.model ProjectFeedback do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :projects, 3

          field :published
          field :project
          field :translations, :globalize_tabs
          field :url
          field :image
        end

        config.model_translation ProjectFeedback do
          field :locale, :hidden
          field :name
          field :short_description
          field :message
        end

        config.model HomeSlide do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :home, 3

          field :published
          field :translations, :globalize_tabs
          field :image
        end

        config.model_translation HomeSlide do
          field :locale, :hidden
          field :image_alt
          field :message
          field :author_name
          field :author_description
        end


        config.model TeamMember do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :about_us, 3

          field :published
          field :featured
          field :translations, :globalize_tabs
          field :image
          field :hover_image, :paperclip
        end

        config.model_translation TeamMember do
          field :locale, :hidden
          field :name
          field :position
        end

        config.model ArticleCategory do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :blog, 2

          field :translations, :globalize_tabs
          #field :seo_tags
        end

        config.model_translation ArticleCategory do
          field :locale, :hidden
          field :name
          field :url_fragment
        end

        config.model Article do
          navigation_label_key :blog, 1

          field :published
          field :article_category
          field :translations, :globalize_tabs
          field :avatar
          field :release_date, :date do
            date_format do
              :default
            end
          end
          field :seo_tags
        end

        config.model_translation Article do
          field :locale, :hidden
          field :name
          field :url_fragment
          field :short_description
          field :content, :ck_editor
        end

        config.model AboutStep do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :about_us, 3

          field :published
          field :translations, :globalize_tabs
          field :icon
        end

        config.model_translation AboutStep do
          field :locale, :hidden
          field :title_part1
          field :title_part2
          field :subtitle
          field :description
        end

        config.model AboutIntro do
          navigation_label_key :about_us, 2

          field :translations, :globalize_tabs
          field :image
        end

        config.model_translation AboutIntro do
          field :locale, :hidden
          field :intro, :ck_editor
        end

        config.model AboutTeamIntro do
          navigation_label_key :about_us, 4

          field :translations, :globalize_tabs
        end

        config.model_translation AboutTeamIntro do
          field :locale, :hidden
          field :intro, :ck_editor
        end

        config.model Partner do
          nestable_list({position_field: :sorting_position})
          navigation_label_key :about_us, 5

          field :published
          field :translations, :globalize_tabs
          field :icon
        end

        config.model_translation Partner do
          field :locale, :hidden
          field :name
          field :site_url
        end

        config.model ContactInfo do
          navigation_label_key :contacts, 5

          field :translations, :globalize_tabs
          field :contact_images
          scheme_enum_field(:contact_images_scheme)
        end

        config.model_translation ContactInfo do
          field :locale, :hidden
          field :phones
          field :emails
          field :address
          field :vacancies_text, :ck_editor
        end

      end
    end
  end
end