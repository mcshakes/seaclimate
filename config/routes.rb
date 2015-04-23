Rails.application.routes.draw do
  root to: "static_pages#home"
  get 'static_pages/about'
  # get "/dashboard", to: "dashboard#show"
  get '/dashboard', to: "dashboard#index"

  get "/auth/:provider/callback", to: "sessions#create"
  resources "users", only: [:show]
end
