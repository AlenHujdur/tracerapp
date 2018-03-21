Rails.application.routes.draw do
  resources :locations
  resources :users

  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
