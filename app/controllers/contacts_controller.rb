class ContactsController < ApplicationController
 def index
  @photos = current_user.friend_photos
  end
end
