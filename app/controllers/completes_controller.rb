class CompletesController < ApplicationController

  def create
  end

  def edit
    
  end

  def update
    @request = Request.find(params[:request_id])
    @complete = @request.complete
    @complete.update(update_params)
    redirect_to request.referer
  end
  

  def destroy
    @request = Request.find(params[:request_id])
    completed = @request.complete
    completed.destroy
    redirect_to replied_engineer_path(@request.id)
  end
  
  
  private
  def update_params
    params.require(:complete).permit(:conclusion)
  end
  
end
