Flicker::Application.routes.draw do
  devise_for :users
  root :to => "Root#root" 
  resource :account
  get '/photos/upload', to: 'Photos#upload' 
  resources :photostreams, :only => [:index, :show]
  resources :photos, :only => [:create, :show]
  resources :photo_sets
end