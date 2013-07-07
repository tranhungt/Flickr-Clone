class PhotosController < ApplicationController
  def upload
    @photos = Photo.new
    @collections = Collection.all
  end

  def create
    photostream = current_user.photostream
    # params[:photo_uploads].each do |_, photoParams|
    #   photo = photostream.photos.build(photoParams[:photo])
    #   params[:tags].each do |_, tagParams|
    #     if tagParams[:tag_id].to_i > 0
    #       photo.photo_taggings.build(:tag_id => tagParams[:tag_id])
    #     else
    #       photo.tags.build(:title => tagParams[:tag_id])
    #     end
    #   end
    # end

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
end
