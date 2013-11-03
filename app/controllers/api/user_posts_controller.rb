class Api::UserPostsController < ApplicationController
  def index
    @posts = current_user.posts

    render 'api/posts/index'
  end
end
