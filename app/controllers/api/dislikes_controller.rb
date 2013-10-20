class Api::DislikesController < Api::ApplicationController
  def create
    post = Post.find(params[:post_id])
    dislike = Dislike.new(user: current_user, dislikable: post)

    dislike.save if !current_user.liked?(post) && !current_user.disliked?(post)

    render status: 200, nothing: true
  end

  def destroy
    post = Post.find(params[:post_id])
    dislike = current_user.dislikes.where(dislikable: post).first

    dislike.destroy if dislike.present?

    render status: 200, nothing: true
  end
end
