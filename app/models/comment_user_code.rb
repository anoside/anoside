class CommentUserCode < ActiveRecord::Base
  attr_accessible :code, :post_id, :user_id
end
