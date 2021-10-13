Rails.application.routes.draw do

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  # get "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  # get "/user/:id", to: "users#show"
  
  resources :reviews
  resources :movies
  resources :users 


  root "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
