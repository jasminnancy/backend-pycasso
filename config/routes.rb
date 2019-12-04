Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update, :destroy]
  resources :fetches, only: [:create]
  resources :statuses, only: [:index, :create, :update, :destroy]
  resources :follows, only: [:create]
  resources :reviews, only: [:create]
  resources :verifications, only: [:index, :create]
  resources :messages, only: [:update]
  resources :conversations, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/find', to: 'follows#removeFollow'
  post '/getConvos', to: 'conversations#getConvos'
end
