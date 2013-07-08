class PhotosController < ApplicationController
  def upload
    @photos = Photo.new
    @collections = Collection.all
  end

  def create
    photostream = current_user.photostream
    @photo = photostream.photos.build(params[:photo])
    if photostream.save!
      render json: @photo
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

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    render :json => @photo
  end

  def upload_multiple
    if params[:photo][:tag_ids]
      params[:photo][:tag_ids].map! do |tag_id|
        tag_id = tag_id.to_i > 0 ? tag_id : Tag.create!(:title => tag_id).id
      end
    end
    @photos = Photo.find(params[:photo_ids])
    @photos.each do |photo|
      photo.update_attributes!(params[:photo])
    end
    redirect_to photostream_path(current_user.photostream)
  end

  def delete_multiple
    @photos = Photo.find(params[:photo_ids])
    @photos.each do |photo|
      photo.destroy
    end

    render json :@photos
  end

  def delete_unsaved
    photos = current_user.photostream.photos.where(:saved => false)
    photos.each do |photo|
      photo.destroy
    end
    render json: {}
  end 
end
