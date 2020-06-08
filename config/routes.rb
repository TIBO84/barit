 Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  get 'bars/:city', to: 'bars#city', constraints: { city: /[[:alpha:]]/ }
  resources :bars, only: [:index, :show, :new, :create]

  resources :reviews, only: [:new, :create]
  resources :reservations, only: [:new, :create, :show, :index]
end
