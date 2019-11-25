Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update]
  resources :fetches, only: [:create]
  resources :statuses
  resources :follows, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/find', to: 'follows#removeFollow'
end
