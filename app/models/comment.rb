class Comment < ActiveRecord::Base
  attr_accessible :body

  belongs_to :comment_user_code
  belongs_to :post


  def build_comment_user_code(user)
    comment_user_code = CommentUserCode.where(post_id: post.id, user_id: user.id).first
 
    if comment_user_code.blank?
      super(code: SecureRandom.urlsafe_base64(8), post_id: post.id, user_id: user.id)
    else
      self.comment_user_code = comment_user_code
    end
  end
end
