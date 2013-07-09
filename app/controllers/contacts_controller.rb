class ContactsController < ApplicationController
  before_filter :authenticate_user!
 def new
    @users = User.all
    @users.delete(current_user)
  end
  
  def create

  end

  def list

  end

  def recent_photos
    @photos = current_user.friend_photos
  end
end
