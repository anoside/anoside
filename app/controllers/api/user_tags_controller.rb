class Api::UserTagsController < Api::ApplicationController
  def index
    @tags = current_user.tags
  end
end
