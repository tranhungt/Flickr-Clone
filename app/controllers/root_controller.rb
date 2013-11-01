class RootController < ApplicationController
  before_filter :authenticate_user!
  def root
    # @photos = Photo.all.reverse
    @photos = Photo.page(params[:page]).per(2)
  end

end
