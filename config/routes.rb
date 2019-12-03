Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/landing', to: 'pages#landing'
  resources :bets, only: [:new, :create]
  resources :search, only: [:new, :create]


	resources :bets, only:[] do
	      member do
	      post 'accept'
	    end
	    member do
	      post 'reject'
	    end
	  end
	  namespace :account do
	    resources :bets, only: [:index] do
	      collection do
	        get 'pending'
	      end
	    end
	  end
	  
  # post '/bets/:id/accept', to: 'bets#accept', as: 'accept_bet'
  # post '/bets/:id/reject', to: 'bets#reject', as: 'reject_bet'
  # get 'account/bets/pending'
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
