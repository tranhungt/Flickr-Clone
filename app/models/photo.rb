class Photo < ActiveRecord::Base
  attr_accessible :title, :url, :image, 
                  :tags_attributes, :photo_collections_attributes
  
  has_attached_file :image, 
                    :styles => { :large => '600x600', 
                                 :medium => "300x300>", 
                                 :thumb => "100x100>" }

  has_many :photo_taggings
  has_many :tags, through: :photo_taggings, source: :tag
  belongs_to :photostream
  has_one :user, through: :photostream
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
  has_many :photo_collections

  accepts_nested_attributes_for :tags, :reject_if => :all_blank
  accepts_nested_attributes_for :photo_collections, :reject_if => :all_blank


  def isCurrentFavorite?
    current_user.favorite_photos.include?(self)
  end
  
  def isFavoriteUser?(user)
    user.favorite_photos.include?(self)
  end
end
