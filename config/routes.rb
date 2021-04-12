Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root controller: "site", action: "index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get "/signup", controller: "users", action: "new", as: :signup
  get "/login", controller: "sessions", action: "new", as: :login
  get "/logout", controller: "sessions", action: "destroy", as: :logout

  get "/dashboard", controller: "app", action: "index", as: :app

end
