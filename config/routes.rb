Rails.application.routes.draw do
  get 'static_pages/home'

  resources :parcels
  root "static_pages#home"
  get "/search", to: "parcels#index"
  post "/search", to: "parcels#search"
  get "auth/:provider/callback", to: "sessions#create"
  post "/login", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "/signout", to: "sessions#destroy", as: "signout"
  get "/login", to: "sessions#new"

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
