class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :username

  has_one :photostream
  has_many :photos, through: :photostream, source: :photos
  has_many :favorites
  has_many :favorite_photos, through: :favorites, 
  source: :photo
  has_many :collections
  has_many :collection_photos, through: :collections, source: :photo_collections

  has_many :friendships
  has_many :friends, through: :friendships
  belongs_to :friendship
  has_many :followers, through: :friendships, source: :user
  has_many :friend_photos, through: :friends, source: :photos


  has_attached_file :avatar, :styles => {:large => "800x800>", :medium => "300x300>", :thumb => "100x100>", :icon => "65x65>" }, :default_url => 'https://s3-us-west-1.amazonaws.com/flickr-clone-photos/photo.jpg'

  validate :username, :unique => true

  before_create :default_values

  def default_values
    self.build_photostream
  end

end
