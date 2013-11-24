class Api::DislikesController < Api::ApplicationController
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
    dislike = Dislike.new(user: current_user, dislikable: resource)

    dislike.save if !current_user.liked?(resource) && !current_user.disliked?(resource)

    render status: 200, nothing: true
  end

  def resource_destroy(resources)
    resource = resources.find(params["#{resources.name.downcase}_id".to_sym])
    dislike = current_user.dislikes.where(dislikable: resource).first

    dislike.destroy if dislike.present?

    render status: 200, nothing: true
  end
end
