class PostsController < ApplicationController
  layout :select_layout

  def index
    unless user_signed_in?
      @user = User.new
    end
  end

  private

  def select_layout
    return 'public' if ('index' == params[:action]) && !user_signed_in?
    
    'application'
  end
end
