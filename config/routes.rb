Rails.application.routes.draw do
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "home/about"
  root "home#index"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"

  post "/users", to: "users#create"
  get "/me", to: "users#me"
  get "/auth/user", to: "auth#auth_user"
  post "/auth/login", to: "auth#login"
  post "/auth/logout", to: "auth#logout"
  get "data_exports/export_to_excel", to: "data_exports#export_to_excel"
end
