class Comment < ActiveRecord::Base
  attr_accessible :body

  belongs_to :comment_user_color
  belongs_to :post


  def build_comment_user_color(user)
    comment_user_color = CommentUserColor.where(post_id: post.id, user_id: user.id).first

    if comment_user_color.blank?
      color_ids = Color.pluck(:id)
      used_color_ids = CommentUserColor.where(post_id: post.id).pluck(:color_id)
      color_id = (color_ids - used_color_ids).sample

      super(color_id: color_id, post_id: post.id, user_id: user.id)
    else
      self.comment_user_color = comment_user_color
    end
  end
end
