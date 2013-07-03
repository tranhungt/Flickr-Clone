class RootController < ApplicationController
  before_filter :authenticate_user!
  def root
    @current_user_photostream = current_user.photostream ||
    Photostream.create!(:user_id => current_user.id)
    @photos = Photo.all
  end
end
