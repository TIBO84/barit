 Rails.application.routes.draw do

  root to: 'pages#home'
  get 'dashboard', to: "dashboards#home", as: :dashboard

  devise_for :users

  # get '/bars/:city', to: 'bars#city', constraints: { city: /[[:alpha:]]+/ }
  resources :bars, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  
  resources :reservations, only: [:new, :create, :show, :index]
end
