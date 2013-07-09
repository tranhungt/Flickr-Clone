class Collection < ActiveRecord::Base
  attr_accessible :title, :user_id
  belongs_to :user
  has_many :photo_collections
  has_many :photos, through: :photo_collections, source: :photo
  validates :title, presence: true
end
