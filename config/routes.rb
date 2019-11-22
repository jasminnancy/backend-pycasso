Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  resources :fetches, only: [:create]
  resources :statuses
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
