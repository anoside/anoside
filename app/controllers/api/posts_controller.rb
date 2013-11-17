class Api::PostsController < Api::ApplicationController
  def index
    language_ids = if user_signed_in?
      current_user.setting.languages.pluck('languages.id')
    else
      session[:accept_language_id]
    end

    @posts = Post.where(language_id: language_ids)
                 .filter(params)
                 .order('created_at DESC')
                 .page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    @post.set_title!
    @post.set_language!

    if @post.save
      current_user.make_viewpoint(@post, original: true)
    end
  end

  def destroy
    post = Post.find(params[:id])

    if current_user.own_post?(post)
      if post.destroy
        render status: 200, nothing: true
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
