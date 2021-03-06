Rails.application.routes.draw do
  get "sitemap", to: "sitemap#index", as: :sitemap_xml, format: "xml"

  mount Cms::Engine => '/'
  mount Ckeditor::Engine => '/ckeditor'
  root as: "root_without_locale", to: "application#root_without_locale"
  get "admin(/*admin_path)", to: redirect{|params| "/#{ I18n.default_locale}/admin/#{params[:admin_path]}"}

  get "likes-count/:resource_type/:id", to: "application#likes_count", as: :likes_count
  post "like/:resource_type/:id", to: "application#like", as: :like

  localized do
    controller "forms" do
      post "contact_request"
      post "faq_question_request"
      post "order_request"
      post "vacancy_request(/:vacancy_id)", action: "vacancy_request", as: :vacancy_request
    end

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    devise_for :users, module: "users", path: "", path_names: {
        sign_in: "login",
        sign_out: 'logout',
    }
    root to: "pages#index"

    controller :pages do
      get "about_us", action: "about_us"
      get "services", action: "services"
      get "faq", action: "faq"
      get "vacancies", action: "vacancies"
      get "privacy_policy", action: "privacy_policy"
      get "contacts", action: "contacts"
    end

    scope "weddings", controller: "weddings" do
      root action: :index, as: :weddings
      get ":id", action: :show, as: :wedding
    end

    scope "events", controller: "events" do
      root action: :index, as: :events
      get ":id", action: :show, as: :event
    end

    scope "blog", controller: "blog" do
      root action: :index, as: :blog
      get ":id", action: :show, as: :blog_article
    end
  end



  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end