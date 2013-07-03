class FavoritesController < ApplicationController
  def index
    @photos = current_user.favorite_photos
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    @favorite.user_id = current_user.id
    @favorite.save
    render json: @favorite
  end

  def destroy
    @favorite = Favorite.where(:photo_id => params[:favorite][:photo_id], :user_id => current_user.id)[0]
    @favorite.destroy
    render json: @favorite
  end
end
