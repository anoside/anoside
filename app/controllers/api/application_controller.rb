class Api::ApplicationController < ApplicationController
  before_filter :response_404


  private

  def response_404
    render(status: 404, text: '404 Not Found') unless params[:format] == 'json'
  end
end
