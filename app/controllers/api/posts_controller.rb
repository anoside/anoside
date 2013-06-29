class Api::PostsController < Api::ApplicationController
  def index
    language_ids = if user_signed_in?
      current_user.preference.languages.pluck('languages.id')
    else
      session[:accept_language_id]
    end

    @posts = Post.where(language_id: language_ids)
  end

  def create
    @post = Post.new(params[:post])

    @post.set_title!
    @post.set_language!

    if @post.save
      current_user.make_viewpoint(@post, original: true)
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if current_user.owns_post?(@post)
      if @post.destroy
        render status: 200, nothing: true
      end
    end
  end
end
