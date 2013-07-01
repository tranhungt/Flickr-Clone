class Tag < ActiveRecord::Base
  attr_accessible :title
  has_many :photo_taggings
  has_many :photos, through: :photo_taggings, source: :photo
end
