Rails.application.routes.draw do

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  # get "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  # get "/add_movie", to: "user_movies#new"
  # post "/add_movie", to: "user_movies#create"
  # delete "/remove_movie", to: "user_movies#destroy"
  get "/edit_list", to: "user_movies#edit"
  patch "/edit_list", to: "user_movies#update" 

  resources :user_movies, only: [:create, :edit, :update, :destroy] 

  # get "/user/:id", to: "users#show"
  resources :reviews
  resources :movies do 
    resources :reviews 
  end
  resources :users do 
    resources :movies do 
      resources :reviews
    end
  end


  root "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
