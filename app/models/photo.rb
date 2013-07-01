class Photo < ActiveRecord::Base
  attr_accessible :title, :url, :image, :tags_attributes
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_many :photo_taggings
  has_many :tags, through: :photo_taggings, source: :tag

  accepts_nested_attributes_for :tags
end
