class PhotoTagging < ActiveRecord::Base
  attr_accessible :photo_id, :tag_id

  belongs_to :photo
  belongs_to :tag
end
