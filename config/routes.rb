Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update, :destroy]
  resources :fetches, only: [:create]
  resources :statuses, only: [:index, :create]
  resources :follows, only: [:create]
  resources :messages, only: [:create, :destroy]
  resources :verifications, only: [:index, :create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/find', to: 'follows#removeFollow'
end
