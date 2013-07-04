class Photostream < ActiveRecord::Base
  attr_accessible :user_id, :username
  has_many :photos
  belongs_to :user
end
