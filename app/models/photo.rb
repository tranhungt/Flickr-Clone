class Photo < ActiveRecord::Base
  attr_accessible :title, :url, :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
