Flicker::Application.routes.draw do
  devise_for :users
  root :to => "Root#root" 
  resource :account
  get '/photos/upload', to: 'Photos#upload' 
  get '/search', to: "Photos#search"

  resources :photostreams, :only => [:index, :show, :edit]
  resources :photos, :only => [:create, :show, :destroy] do
    collection do
      put :upload_multiple
      delete :delete_multiple
      get :delete_unsaved
      get :next
      get :previous
    end
  end
  resources :collections do
    collection do
      get :user_collections
    end
  end
  resources :favorites
  resources :friendships
  resources :contacts do
    collection do
      get :recent_photos
      get :list
    end
  end
  resources :tags, :only => [:index]
  post '/delete_favorite', to: 'Favorites#destroy'
  post '/unfriend', to: 'Friendships#destroy'
  get '/search_by_tag/*tag_name', to: 'Photos#tag_search', as: "search_by_tag"
end