Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/term", to: "static_pages#term"
    get "/security", to: "static_pages#security"
    get "/order_details", to: "order_details#index"

    as :user do
      get "signup", to: "users/registrations#new"
      get "signin", to: "devise/sessions#new"
      post "signin", to: "devise/sessions#create"
      delete "signout", to: "devise/sessions#destroy"
      get "profile", to: "devise/registrations#edit"
      put "profile", to: "devise/registrations#update"
    end

    devise_for :users, controllers: {registrations: "users/registrations"}

    resources :users, only: [:show, :edit, :update]
    resources :restaurants do
      member do
        get :orders
      end
    end
    resources :orders, except: %i(edit destroy)
    resources :dishes
  end
end
