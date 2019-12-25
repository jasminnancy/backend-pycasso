Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update, :destroy]
  resources :fetches, only: [:create]
  resources :statuses, only: [:index, :create, :update, :destroy]
  resources :follows, only: [:create]
  resources :close_friends, only: [:create]
  resources :reviews, only: [:index, :create]
  resources :verifications, only: [:index, :create]
  resources :messages, only: [:update]
  resources :conversations, only: [:create]
  resources :photos, only: [:destroy]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/find', to: 'follows#removeFollow'
  post '/remove', to: 'close_friends#remove'
  post '/getConvos', to: 'conversations#getConvos'
  post '/upload', to: 'photos#upload'
  post '/photos', to: 'photos#allphotos'
  post '/featured', to: 'photos#featured'
end
