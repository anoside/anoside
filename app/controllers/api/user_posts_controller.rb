class Api::UserPostsController < ApplicationController
  def index
    @posts = current_user.posts.order(created_at: :desc)

    render 'api/posts/index'
  end
end
