Flicker::Application.routes.draw do
  devise_for :users
  root :to => "Root#root" 
  resource :account
  get '/photos/upload', to: 'Photos#upload' 
  resources :photos
end