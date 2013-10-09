class Api::ViewpointsController < Api::ApplicationController
  def show
    @viewpoint = Viewpoint.find(params[:id])

    render json: @viewpoint
  end
end
