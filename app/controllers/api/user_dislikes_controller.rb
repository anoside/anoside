class Api::UserDislikesController < ApplicationController
  def index
    @posts = current_user.dislike_posts

    render 'api/posts/index'
  end
end
