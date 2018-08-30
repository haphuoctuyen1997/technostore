Rails.application.routes.draw do
  root "static_pages#home"
  namespace :backend do
    get "/", to: "static_page#index"

    resources :categories
    resources :users
    resources :requests
  end
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"

  resources :suggests
  resources :users
  resources :products, only: :show
  resources :categories
end
