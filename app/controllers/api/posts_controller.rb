class Api::PostsController < Api::ApplicationController
  def index
    language_ids = if user_signed_in?
      current_user.preference.languages.pluck('languages.id')
    else
      session[:accept_language_id]
    end

    @posts = Post.where(language_id: language_ids).order('created_at DESC')

    render json: @posts
  end

  def create
    @post = Post.new(post_params)

    @post.set_title!
    @post.set_language!

    if @post.save
      current_user.make_viewpoint(@post, original: true)
    end

    render json: @post
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
