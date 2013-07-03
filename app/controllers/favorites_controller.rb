class FavoritesController < ApplicationController
  def index
    @photos = current_user.favorite_photos
  end
   
  def create
    @favorite = Favorite.new(params[:favorite])
    @favorite.save
    render json: @favorite
  end
end
