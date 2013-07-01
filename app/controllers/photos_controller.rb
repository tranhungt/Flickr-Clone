class PhotosController < ApplicationController
  def upload
    @photos = Photo.new
  end
  def create
    @photo = Photo.create!(params[:photo])
    redirect_to photos_path
  end

  def index
    @photos = Photo.all
  end
end
