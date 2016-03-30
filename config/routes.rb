Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root             'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'select'  => 'portfolios#select'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  get 'ticker/:query' => 'tickers#typeahead'
  post 'login'   => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  resources :ticker
  resources :users
  resources :portfolios
  resources :value_portfolios
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
