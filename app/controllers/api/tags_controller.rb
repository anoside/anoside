class Api::TagsController < Api::ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.tag_list = params[:tag_list]

    if @post.save
      respond_to do |format|
        format.json { render :create }
      end
    end
  end
end
