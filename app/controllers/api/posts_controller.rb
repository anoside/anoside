class Api::PostsController < Api::ApplicationController
  def index
    language_ids = if user_signed_in?
      current_user.preference.languages.pluck('languages.id')
    else
      session[:accept_language_id]
    end

    @posts = Post.where(language_id: language_ids).order('created_at DESC')
  end

  def create
    @post = Post.new(params[:post])

    @post.user_id = current_user.id if user_signed_in?
    @post.set_title!
    @post.set_language!

    @post.save
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
