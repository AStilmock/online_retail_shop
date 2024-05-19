Rails.application.routes.draw do
  root to: 'users#index'
  
  resources :users
  resources :categories, only: [:index, :show]
  resources :items, only: [:index, :show]
  

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get '/shopping', to: 'shopping#index'
  get '/users/:id/shopping', to: 'user/shopping#index', as: 'user_shopping'
end
