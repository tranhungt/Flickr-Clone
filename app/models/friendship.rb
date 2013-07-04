class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  belongs_to :friend, class: "User", foreign_key: :friend_id
  belongs_to :user
end
