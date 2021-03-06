Rails.application.routes.draw do


  get 'comments/create'

  get 'line_items/index'

  get 'line_items/show'

  get 'line_items/new'

  get 'line_items/edit'

  get 'line_items/create'

  get 'line_items/update'

  get 'line_items/destroy'

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  root 'home#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  patch 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'profile', to: 'users#show'

  post 'category/:id/edit', to: 'categories#update'

  delete 'category/:id', to: 'categories#destroy'

  post 'user/:id/edit', to: 'users#update'

  patch 'parts/:id/edit', to: 'parts#update'

  get "paypal_express/checkout"

   get "oil_change" => 'home#oil_change', as: 'oil_change'

   get "adjustments" => 'home#adjustments', as: 'adjustments'

   get "tunning" => 'home#tunning', as: 'tunning'
   #cannot be in the application controller

  # delete 'parts/:id', to: 'parts#destroy'


  resources :users
  resources :parts do
    resources :comments, only: [:create, :destroy]
  end
  resources :carts
  resources :orders
  resources :categories
  resources :line_items
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

end
