class PostsController < ApplicationController
  layout :select_layout

  private

  def select_layout
    return 'public' if 'index' == params[:action] && !user_signed_in?
    
    'application'
  end
end
