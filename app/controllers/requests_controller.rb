class RequestsController < ApplicationController
  
  def index
    @requests = Request.all.order("created_at DESC").includes(:customer)
  end
  
  def show
    @request = Request.find(params[:id])
  end
  

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
    else
      render action: :new
    end
    
  end
  
  private
  def request_params
    params.require(:request).permit(:title, :content, :budget_id, :term_id, :approach_id, :other).merge(customer_id: current_customer.id)
  end
  
  
end
