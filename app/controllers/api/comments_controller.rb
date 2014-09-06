class Api::CommentsController < Api::ApplicationController
  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    viewpoint = current_user.make_viewpoint(@post)

    @comment.number = @post.comments.count + 1
    @comment.viewpoint = viewpoint

    if @comment.save
      post_user = @post.viewpoint.user

      if post_user.recieve_when_commented?(@comment)
        NotificationMailer.comment_on_post(@comment.id).deliver
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
