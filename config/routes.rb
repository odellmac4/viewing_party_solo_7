Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, controller: "user_movies", only: [:index, :show] do
      resources :viewing_party, controller: "user_parties", only: [:new]
    end
  end
end
