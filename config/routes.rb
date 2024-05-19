Rails.application.routes.draw do
  root to: 'users#index'
  
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get '/shopping', to: 'shopping#index'
  get '/shopping/categories/:id', to: 'shopping_items#show', as: 'shopping_category'
  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
end
