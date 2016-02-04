class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.create(request_params)
    redirect_to @request
  end

  def show
    @request = Request.find(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:wanted_id, :unwanted_id)
  end
end
