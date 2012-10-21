class PostsController < InheritedResources::Base
  def index
    @post = Post.new

    index!
  end

  def create
    @post = Post.new(params[:post])

    @post.author_id = current_user.id if user_signed_in?
    @post.set_title!

    create! { root_path }
  end
end
