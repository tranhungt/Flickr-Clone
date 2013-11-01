class Photo < ActiveRecord::Base
  attr_accessible :title, :url, :image, 
                  :tags_attributes, :photo_collections_attributes, :tag_ids, :saved, :description, :collection_ids
  
  has_attached_file :image, 
                    :styles => { :large => '1000x1000>', 
                                 :medium => "450x450>", 
                                 :thumb => "200x200>",
                                 :icon => "30x30>" }

  has_many :photo_taggings, :dependent => :destroy
  has_many :tags, through: :photo_taggings, source: :tag
  belongs_to :photostream
  has_one :user, through: :photostream
  has_many :favorites, :dependent => :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :photo_collections, :dependent => :destroy
  has_many :collections ,through: :photo_collections

  accepts_nested_attributes_for :tags, :reject_if => :all_blank
  accepts_nested_attributes_for :photo_collections, :reject_if => :all_blank

  validates :image, :presence => true
  validates_associated :user

  def isCurrentFavorite?
    current_user.favorite_photos.include?(self)
  end
  
  def isFavoriteUser?(user)
    user.favorite_photos.include?(self)
  end

  def url
    image.url(:thumb)
  end

  def serializable_hash(options= {})
    super(options.merge({:method => [:url]} ))
  end

  def self.all
    Photo.where(:saved => true)
  end

  def self.where(options = {})
    options[:saved] = true
    super(options)
  end
end
