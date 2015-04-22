Rails.application.routes.draw do
  root to: "static_pages#home"
  get 'static_pages/about'
  get "/dashboard", to: "dashboard#show"

  # get "/auth/:provider/callback", to: "sessions#create"
end
