class ContactsController < ApplicationController
  before_filter :authenticate_user!
 def new
    @users = User.all
    friends = current_user.friends
    friends.each{|friend| @users.delete(friend)}
    @users.delete(current_user)

  end

  def list
    @friends = current_user.friends
  end

  def recent_photos
    @photos = current_user.friend_photos
  end
end
