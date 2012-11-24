class PostsController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @post = Post.new

    index! do
      @posts = @posts.order('created_at DESC')
    end
  end

  def create
    @post = Post.new(params[:post])

    @post.user_id = current_user.id if user_signed_in?
    @post.set_title!

    create! { root_path }
  end

  def update
    @post = Post.find(params[:id])
    @post.tag_list = params[:post][:tag_list]

    if @post.save
      respond_to do |format|
        format.json { render :update }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])

    destroy! if current_user.owns_post?(@post)
  end
end
