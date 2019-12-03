Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/landing', to: 'pages#landing'
  resources :bets, only: [:new, :create]
  resources :search, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
