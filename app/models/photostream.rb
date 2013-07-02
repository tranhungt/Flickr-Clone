class Photostream < ActiveRecord::Base
  attr_accessible :user_id
  has_many :photos
  belongs_to :user
end
