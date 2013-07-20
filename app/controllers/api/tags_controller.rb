class Api::TagsController < Api::ApplicationController
  def index
    @tags = if params.include?(:ids)
      ids = params[:ids].split(',').map(&:strip)

      Tag.where(id: ids)
    else
      Tag.scoped
    end
  end

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
