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
    params[:photo][:tag_ids].map! do |tag_id|
      tag_id = tag_id.to_i > 0 ? tag_id : Tag.create!(:title => tag_id).id
    end
    @photos = Photo.find(params[:photo_ids])
    @photos.each do |photo|
      photo.update_attributes!(params[:photo])
    end
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
    redirect_to photostream_path(current_user.photostream)
  end
end
