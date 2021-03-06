class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.create(request_params)
    redirect_to @request
  end

  def accept
    @request = Request.create(request_params)
    Swap.implement(@request)
    destroy_pending_requests(@request.wanted_id, @request.unwanted_id)
    redirect_to user_path(current_user) and return
  end

  def show
    @request = Request.find(params[:id])
  end

  def destroy_pending_requests(id1, id2)
    @requests = Request.where (["wanted_id= ? or unwanted_id = ? or wanted_id = ? or unwanted_id = ?", id1, id2, id1, id2])
    @requests.destroy_all
  end

  private

  def request_params
    params.require(:request).permit(:wanted_id, :unwanted_id)
  end
end
