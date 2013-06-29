class Api::CommentsController < Api::ApplicationController
  def index
    @comments = if params.include?(:ids)
      ids = params[:ids].split(',').map(&:strip)

      Comment.where(id: ids)
    else
      Comment.scoped
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    viewpoint = current_user.make_viewpoint(@post)

    @comment.relative_id = @post.comments.count + 1
    @comment.viewpoint = viewpoint

    if @comment.save
      user = @post.viewpoint.user

      if user.email.present? && user.preference.email_when_commented?
        CommentNotificationWorker.perform_async(@post.id, @comment.id)
      end

      render :create
    end
  end
end
