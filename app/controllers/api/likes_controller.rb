class Api::LikesController < Api::ApplicationController
  def comment_create
    resource_create(Comment)
  end

  def comment_destroy
    resource_destroy(Comment)
  end

  def post_create
    resource_create(Post)
  end

  def post_destroy
    resource_destroy(Post)
  end

  private

  def resource_create(resources)
    resource = resources.find(params["#{resources.name.downcase}_id".to_sym])
    like = Like.new(user: current_user, likable: resource)

    like.save if !current_user.liked?(resource) && !current_user.disliked?(resource)

    render status: 200, nothing: true
  end

  def resource_destroy(resources)
    resource = resources.find(params["#{resources.name.downcase}_id".to_sym])
    like = current_user.likes.where(likable: resource).first

    like.destroy if like.present?

    render status: 200, nothing: true
  end
end
