Rails.application.routes.draw do
  root to: 'users#index'
  
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get '/shopping', to: 'shopping#index'
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show'
  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
end
