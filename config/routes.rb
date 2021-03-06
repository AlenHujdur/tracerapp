Rails.application.routes.draw do
  #devise_for :users
  root 'locations#index'
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"

  get 'locations/:locations/:id', to: 'cameras#new'
  resources :locations
  resources :users
  resources :cameras

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
