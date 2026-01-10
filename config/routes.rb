Rails.application.routes.draw do
  root to: 'users#index'
  
  resources :users
  resources :categories, only: [:index, :show]
  resources :items, only: [:index, :show]
  resources :discounts, only: [:index, :show]
  resources :employees, only: [:index, :show]
  resources :invoices, only: [:index, :show]
  resources :invoice_items, only: [:index, :show]
  resources :purchase_orders, only: [:index, :show]
  resources :purchase_order_items, only: [:index, :show]
  resources :sales, only: [:index, :show]
  resources :sale_invoices, only: [:index, :show]
  resources :vendors, only: [:index, :show]
  
  get '/' => 'users#index'
  # get 'online-retail-shop.vercel.app/' => 'users#index'
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  get 'logout' => 'user_sessions#destroy', :as => :logout
  post 'logout' => 'user_sessions#destroy'

  get '/shopping', to: 'shopping#index'
  # get '/categories', to: 'categories#index'
  # get '/categories/:id', to: 'categories#show'
  get '/users/:id/shopping', to: 'user/shopping#index', as: 'user_shopping'
  get '/users/:id/categories/:id', to: 'user/category#show', as: 'user_category'
  get '/users/:id/items/:id', to: 'user/item#show', as: 'user_item'
end
