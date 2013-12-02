class TimelinesController < ApplicationController
  before_filter do
    redirect_to root_path if user_signed_in?
  end
end
