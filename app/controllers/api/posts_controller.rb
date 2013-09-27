class Api::PostsController < Api::ApplicationController
  def index
    language_ids = if user_signed_in?
      current_user.preference.languages.pluck('languages.id')
    else
      session[:accept_language_id]
    end

    @posts = Post.where(language_id: language_ids).order('created_at DESC')
  end
end
