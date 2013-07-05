class PhotosController < ApplicationController
  def upload
    @photos = Photo.new
    @collections = Collection.all
  end
  def create
    photostream = current_user.photostream
    params[:photo_uploads].each do |_, photoParams|
      photostream.photos.build(photoParams[:photo])
    end

    if photostream.save!
      redirect_to photostreams_path
    else
      render :upload
    end
  end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @tags = @photo.tags
  end
end
