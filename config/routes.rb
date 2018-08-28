Rails.application.routes.draw do
	root "static_pages#home"

	namespace :backend do
		get "/", to: "static_page#index"
	end

	resources :users

	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"
	get "/signup", to: "users#new"
end
