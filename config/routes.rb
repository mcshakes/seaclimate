Rails.application.routes.draw do
  root to: "static_pages#home"
  get 'static_pages/about'
  get '/dashboard', to: "dashboard#index"

  get "/auth/:provider/callback", to: "sessions#create"
  post "/login", to: "sessions#create"
  
  delete "/logout", to: "sessions#destroy"

  resources "users", only: [:show]

end
