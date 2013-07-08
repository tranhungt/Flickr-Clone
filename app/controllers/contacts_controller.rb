class ContactsController < ApplicationController
  before_filter :authenticate_user!
 def index
  @photos = current_user.friend_photos
  end
end
