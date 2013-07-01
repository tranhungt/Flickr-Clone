class PhotosController < ApplicationController
  def upload
    @photos = Photo.new
  end
  def create
    @photo = Photo.new(params[:photo])
    @photo.save
    redirect_to photos_path
  end

  def index
    @photos = Photo.all
  end
end
