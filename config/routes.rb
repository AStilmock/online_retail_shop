Rails.application.routes.draw do
  root to: 'users#index'
  
  resources :users
  # resources :categories, only: [:index, :show]
  resources :items, only: [:index, :show]
  
  get '/' => 'users#index'
  get 'online-retail-shop.vercel.app/' => 'users#index'
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  get 'logout' => 'user_sessions#destroy', :as => :logout

  get '/shopping', to: 'shopping#index'
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show'
  get '/users/:id/shopping', to: 'user/shopping#index', as: 'user_shopping'
  get '/users/:id/categories/:id', to: 'user/category#show', as: 'user_category'
  get '/users/:id/items/:id', to: 'user/item#show', as: 'user_item'
end
