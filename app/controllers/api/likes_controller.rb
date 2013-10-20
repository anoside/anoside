class Api::LikesController < Api::ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new(user: current_user, likable: post)

    like.save if !current_user.liked?(post) && !current_user.disliked?(post)

    render status: 200, nothing: true
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.where(likable: post).first

    like.destroy if like.present?

    render status: 200, nothing: true
  end
end
