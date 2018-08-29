Rails.application.routes.draw do
  root "static_pages#home"
  namespace :backend do
    get "/", to: "static_page#index"
  end
end
