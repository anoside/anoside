class Api::UserLikesController < ApplicationController
  def index
    @posts = current_user.like_posts

    render 'api/posts/index'
  end
end
