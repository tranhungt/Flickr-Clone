Flicker::Application.routes.draw do
  devise_for :users
  root :to => "Root#root" 
  resource :account
  get '/photos/upload', to: 'Photos#upload' 
  resources :photostreams, :only => [:index, :show]
  resources :photos, :only => [:create, :show]
  resources :collections
  resources :favorites
  resources :friendships
  resources :contacts
  resources :tags, :only => [:index]
  post '/delete_favorite', to: 'Favorites#destroy'
  post '/unfriend', to: 'Friendships#destroy'
end