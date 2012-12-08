class CommentUserColor < ActiveRecord::Base
  attr_accessible :color_id, :post_id, :user_id

  belongs_to :color
  belongs_to :post
  belongs_to :user
end
