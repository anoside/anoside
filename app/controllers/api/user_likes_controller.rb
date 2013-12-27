class Api::UserLikesController < ApplicationController
  def index
    @posts = current_user.like_posts.order(created_at: :desc)

    render 'api/posts/index'
  end
end
