class Collection < ActiveRecord::Base
  attr_accessible :title, :user_id
  belongs_to :user
  has_many :photo_collections
end
