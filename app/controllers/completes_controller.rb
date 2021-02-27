class CompletesController < ApplicationController

  def create
    @request = Request.find(params[:request_id])
    Complete.create(complete_params)
    redirect_to replied_engineer_path(@request.id)
  end

  def destroy
    @request = Request.find(params[:request_id])
    completed = @request.complete
    completed.destroy
    redirect_to replied_engineer_path(@request.id)
  end
  
  
  private
  def complete_params
    params.permit(:conclusion).merge(request_id: @request.id)
  end
  
end
