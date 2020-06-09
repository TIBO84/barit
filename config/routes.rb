 Rails.application.routes.draw do

  root to: 'pages#home'
  get 'dashboards/home'

  devise_for :users

  # get '/bars/:city', to: 'bars#city', constraints: { city: /[[:alpha:]]+/ }
  resources :bars, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:new, :create]
  end
  resources :reviews, only: [:new, :create]
  resources :reservations, only: [:new, :create, :show, :index]
end
