class PhotostreamsController < ApplicationController
  def index
    @photos = Photo.all
  end
  def show
    @photos = Photostream.find(params[:id]).photos.includes(:favorited_users)
  end
end
