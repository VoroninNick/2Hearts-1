Rails.application.routes.draw do
  get "sitemap", to: "sitemap#index", as: :sitemap_xml, format: "xml"

  mount Cms::Engine => '/'
  mount Ckeditor::Engine => '/ckeditor'
  root as: "root_without_locale", to: "application#root_without_locale"
  get "admin(/*admin_path)", to: redirect{|params| "/#{ I18n.default_locale}/admin/#{params[:admin_path]}"}

  localized do
    controller "forms" do
      #post "call_request"
    end

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    devise_for :users, module: "users", path: "", path_names: {
        sign_in: "login",
        sign_out: 'logout',
    }
    root to: "pages#index"

    controller :pages do
      get "about", action: "about"
      get "services", action: "services"
      get "faq", action: "faq"
      get "vacancies", action: "vacancies"
      get "private_policy", action: "private_policy"
      get "contact_us", action: "contact_us"
    end

    get "projects_index", to: "projects#index", as: :projects
    get "projects/:id", to: "projects#show", as: :project

    get "blog_index", to: "blog#index", as: :blog
    get "blog", to: "blog#show", as: :blog_article
  end

  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end