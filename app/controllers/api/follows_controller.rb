class Api::FollowsController < ApplicationController
  def create
    @tag = Tag.find_by(name: params[:tag_id])
    current_user.follow(@tag)
  end

  def destroy
    @tag = Tag.find_by(name: params[:tag_id])
    current_user.unfollow(@tag)
  end
end
