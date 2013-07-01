Flicker::Application.routes.draw do
  devise_for :users
  root :to => "Root#root" 

  get '/photos/upload', to: 'Photos#upload' 
end