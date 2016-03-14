Rails.application.routes.draw do
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

  post 'part/:id/edit', to: 'parts#update'

  delete 'part/:id', to: 'parts#destroy'

  resources :users
  resources :parts
  resources :categories

end
