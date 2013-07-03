class PhotostreamsController < ApplicationController
  def index
    @photos = Photo.all #.where("favorites.user_id => ?",current_user.id)
  end
  def show
    @photos = Photostream.find(params[:id]).photos(include: :favorites).where(:favorites.user_id == current_user.id)
  end
end
