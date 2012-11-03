class PostsController < InheritedResources::Base
  def index
    @post = Post.new

    index! do
      @posts = @posts.order('created_at DESC')
    end
  end

  def create
    @post = Post.new(params[:post])

    @post.author_id = current_user.id if user_signed_in?
    @post.set_title!

    create! { root_path }
  end

  def update
    @post = Post.find(params[:id])
    @post.tag_list = params[:post][:tag_list]

    render :update if @post.save
  end

  def destroy
    @post = Post.find(params[:id])

    destroy! if current_user.owns_post?(@post)
  end
end
