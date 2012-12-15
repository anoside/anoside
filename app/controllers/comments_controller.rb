class CommentsController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])

    @comment.relative_id = @post.comments.count + 1
    @comment.build_comment_user_code(current_user)

    if @comment.save
      user = @post.user

      if user.email.present? && user.preference.email_when_commented?
        CommentNotificationWorker.perform_async(@post.id, @comment.id)
      end

      render :create
    end
  end
end
