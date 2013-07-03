class Photo < ActiveRecord::Base
  attr_accessible :title, :url, :image, :tags_attributes
  has_attached_file :image, :styles => {:large => '600x600', :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_many :photo_taggings
  has_many :tags, through: :photo_taggings, source: :tag
  belongs_to :photostream
  has_one :user, through: :photostream
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
  accepts_nested_attributes_for :tags

  def isCurrentFavorite?
    current_user.favorite_photos.include?(self)
  end
  def isFavoriteUser?(user)
    user.favorite_photos.include?(self)
  end
end
