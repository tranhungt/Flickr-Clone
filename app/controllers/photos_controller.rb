class PhotosController < ApplicationController
  before_filter :authenticate_user!
  def upload
    @photos = Photo.new
    @collections = current_user.collections
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
    @photos = Photo.page(params[:page]).per(2)
  end

  def show
    @photo = Photo.includes(:tags).find(params[:id])
    @tags = @photo.tags
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    render :json => {status:"ok"}
  end

  def upload_multiple
    if params[:photo][:tag_ids]
      params[:photo][:tag_ids].map! do |tag_id|
        tag_id = tag_id.to_i > 0 ? tag_id : Tag.create(:title => tag_id).id
      end
    end

    if params[:photo][:collection_ids]
      params[:photo][:collection_ids].map! do |collection_id|
        collection_id = collection_id.to_i > 0 ? collection_id : Collection.create(:title => collection_id, :user_id => current_user.id).id
      end
    end
    @photos = Photo.find(params[:photo_ids])
    @photos.each do |photo|
      photo.update_attributes(params[:photo])
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

  def tag_search
    @tag_name = params[:tag_name]
    @tag = Tag.where(:title => @tag_name)
    @photos = []
    @search_type = "tag name"
    @search_filter = @tag_name
    unless @tag.empty?
      @photos = @tag[0].photos
    end
    render :search_result
  end

  def search
    params[:tag_name] = params[:search_filter]
    tag_search
  end

  def next
    current_photo = Photo.find(params[:current_photo_id])
    array = current_photo.photostream.photos.order("id asc")
    pos = array.index(current_photo)
    @photo = array[pos.next] || array.first
    @tags = @photo.tags
    render :show
  end 

  def previous
    current_photo = Photo.find(params[:current_photo_id])
    array = current_photo.photostream.photos.order("id asc")
    pos = array.index(current_photo)
    @photo = array[pos.pred] || array.last
    @tags = @photo.tags
    render :show
  end
end
