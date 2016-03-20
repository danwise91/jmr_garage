Rails.application.routes.draw do


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


  # delete 'parts/:id', to: 'parts#destroy'


  resources :users
  resources :parts
  resources :categories
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :conversations do
    resources :messages
  end

end
