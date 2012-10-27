class CommentsController < InheritedResources::Base
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])

    @comment.relative_id = @post.comments.count + 1

    if @comment.save
      render :create
    end
  end
end
