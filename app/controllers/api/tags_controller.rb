class Api::TagsController < Api::ApplicationController
  def index
    post = Post.find(params[:post_id])
    @tags = post.tags
  end

  def create
    post = Post.find(params[:post_id])
    post.tag_list = params[:tag_list]

    if post.save
      @tags = post.tags
    end
  end
end
