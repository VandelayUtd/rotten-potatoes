Rails.application.routes.draw do

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  get "/edit_list", to: "user_movies#edit"
  patch "/edit_list", to: "user_movies#update" 
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  resources :user_movies, only: [:create, :edit, :update, :destroy] 

  resources :movies 

  resources :users do 
    resources :movies do 
      resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    end
  end


  root "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
