class PhotostreamsController < ApplicationController
  def index
    @photos = Photo.all
  end
  def show
    @photos = Photostream.find(params[:id]).photos
  end
end
