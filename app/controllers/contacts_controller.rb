class ContactsController < ApplicationController
  before_filter :authenticate_user!
 def new
    @users = User.all
    @users.delete(current_user)
  end

  def list
    @friends = current_user.friends
  end

  def recent_photosa
    @photos = current_user.friend_photos
  end
end
