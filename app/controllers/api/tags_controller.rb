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

  def show
    @tag = Tag.find_by(name: params[:id])
  end

  def popular
    @tags = Tag.order(posts_count: :desc).limit(10)
  end
end
