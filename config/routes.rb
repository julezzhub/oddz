Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/landing', to: 'pages#landing'
  resources :bets, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :friends, only: [:index] do
    member do
      get 'friends', to: "friends#friends"
      post 'decline-friend', to: "friends#decline_friend"
      post 'accept-friend', to: "friends#accept_friend"
    end
  end
  post 'request-friend', to: "friends#request_friend"
end
