class PhotostreamsController < ApplicationController
  def index
    @photos = Photo.all #.where("favorites.user_id => ?",current_user.id)
  end
  def show
    photostream = Photostream.find(params[:id])
    @photos = photostream.photos
    @user = photostream.user
  end
  def edit
    @photos = Photostream.find(params[:id]).photos
  end

end
