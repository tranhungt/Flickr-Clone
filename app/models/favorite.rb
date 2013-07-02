class Favorite < ActiveRecord::Base
  attr_accessible :photo_id, :user_id
  belongs_to :photo
  belongs_to :user
end
