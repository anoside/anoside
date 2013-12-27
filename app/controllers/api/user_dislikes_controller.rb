class Api::UserDislikesController < ApplicationController
  def index
    @posts = current_user.dislike_posts.order(created_at: :desc)

    render 'api/posts/index'
  end
end
