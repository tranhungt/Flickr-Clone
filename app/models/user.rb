class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar

  has_one :photostream
  has_many :photos, through: :photostreams
  has_many :favorites
  has_many :favorite_photos, through: :favorites, 
  source: :photo
  has_many :collections
  has_many :collection_photos, through: :collections, source: :photo_collections

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end
