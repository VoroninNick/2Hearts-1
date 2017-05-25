def svg_icon_pretty_value
  pretty_value do
    if value.presence
      v = bindings[:view]
      url = resource_url
      if image
        thumb_url = resource_url(thumb_method)
        image_html = v.image_tag(thumb_url, class: 'img-thumbnail', style: "max-width: 100px")
        url != thumb_url ? v.link_to(image_html, url, target: '_blank') : image_html
      else
        v.link_to(nil, url, target: '_blank')
      end
    end
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
              only [Cms::Page, Vacancy, FaqQuestion, Service, ProjectCategory]
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
            partnership: 500,
            brands: 600,
            services: 700,
            media: 800,
            contacts: 900,
            tags: 1000,
            users: 1100,
            settings: 1200,
            pages: 1300,
            assets: 1400
          }
        end

        config.navigation_static_links = {
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
          end

          edit do
            field :name do
              read_only true
              def value
                k = @bindings[:object].type.underscore.split("/").last
                I18n.t("activerecord.models.pages.#{k}", raise: true) rescue k.humanize
              end
            end
            field :seo_tags

          end

        end

        config.model_translation Cms::Page do

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
          field :translations, :globalize_tabs
        end

        config.model_translation Attachable::Asset do
          field :locale, :hidden
          field :data_alt
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
        # Application specific models
        # ===================================================
        config.include_models Vacancy, FaqQuestion, Service, Project, ProjectCategory, ProjectFeedback
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
          #field :small_title_image do
          #  svg_icon_pretty_value
          #end
          #field :large_title_image do
          #  svg_icon_pretty_value
          #end
          field :translations, :globalize_tabs
          field :images
        end

        config.model_translation Service do
          field :locale, :hidden
          field :name
          field :url_fragment
          field :short_description
          field :quote_text
          field :content, :ck_editor
        end

        config.model Project do
          navigation_label_key :projects, 1

          group :basic do
            field :published
            field :project_category
            field :instagram_hash_tag
            field :release_date do
              date_format do
                :default
              end
            end
            field :avatar do
              svg_icon_pretty_value
            end
            field :translations, :globalize_tabs
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
          end

          group :idea_and_solution do
            field :idea_and_solution_images
            field :idea_and_solution_banner do
              svg_icon_pretty_value
            end
          end

          group :result do
            field :result_images
            field :result_banner do
              svg_icon_pretty_value
            end
            field :result_banner_mobile do
              svg_icon_pretty_value
            end
          end

        end

        config.model_translation Project do
          field :locale, :hidden
          group :basic do
            field :name
            field :url_fragment
          end

          group :summary do
            field :idea_and_organization
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
            field :idea_and_solution_text, :ck_editor
            field :idea_and_solution_quote_text
            field :idea_and_solution_quote_author
          end

          group :result do
            field :result_text, :ck_editor
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
      end
    end
  end
end