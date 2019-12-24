Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/term", to: "static_pages#term"
    get "/security", to: "static_pages#security"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/order_details", to: "order_details#index"

    resources :users
    resources :restaurants do
      member do
        get :orders
      end
    end
    resources :orders, except: %i(edit destroy)
  end
end
