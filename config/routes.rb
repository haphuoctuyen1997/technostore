Rails.application.routes.draw do
  root "static_pages#home"
  namespace :backend do
    get "/", to: "static_page#index"
  end
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
end
