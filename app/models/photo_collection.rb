class PhotoCollection < ActiveRecord::Base
  attr_accessible :collection_id, :photo_id
  belongs_to :collection
  belongs_to :photo
end
