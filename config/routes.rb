Rails.application.routes.draw do
  root to: "pages#index"

  controller :pages do
    get "about", action: "about"
    get "services", action: "services"
    get "blog", action: "blog"
    get "blog_one", action: "blog_one"
    get "projects", action: "projects"
    get "project_one", action: "project_one"
    get "faq", action: "faq"
    get "vacancies", action: "vacancies"
    get "private_policy", action: "private_policy"
    get "contact_us", action: "contact_us"
    get "not_found", action: "not_found"
  end

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount Ckeditor::Engine => '/ckeditor'
  #devise_for :users


  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end