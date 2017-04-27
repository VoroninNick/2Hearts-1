Rails.application.routes.draw do
  root to: "pages#index"

  controller :pages do
    get "about", action: "about"
    get "services", action: "services"
    get "blog", action: "blog"
    get "blog_one", action: "blog_one"
    get "projects", action: "projects"
    get "project_one", action: "project_one"
    # get "contact-us", action: "contact_us"
  end

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount Ckeditor::Engine => '/ckeditor'
  #devise_for :users


  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end