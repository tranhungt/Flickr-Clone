class PhotoTagging < ActiveRecord::Base
  attr_accessible :photo_id, :tag_id
end
