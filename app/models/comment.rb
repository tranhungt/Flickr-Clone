class Comment < ActiveRecord::Base
  attr_accessible :body, :comment_id, :photo_id, :user_id
end
