class PostsController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:create, :update, :destroy]

  # def create
  #   @post = Post.new(params[:post])

  #   @post.user_id = current_user.id if user_signed_in?
  #   @post.set_title!
  #   @post.set_language!

  #   create! { root_path }
  # end

  def destroy
    @post = Post.find(params[:id])

    destroy! if current_user.owns_post?(@post)
  end
end
