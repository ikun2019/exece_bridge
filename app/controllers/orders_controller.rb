class OrdersController < ApplicationController

  def create
    @request = Request.find(params[:request_id])
    @order = Order.new(request_id: @request.id, engineer_id: current_engineer.id)
    if @request.order.present?
      redirect_to "/requests/#{@order.request_id}"
    else
      @order.save
      redirect_to "/requests/#{@order.request_id}"
    end
  end

  def destroy
    @request = Request.find(params[:request_id])
    @order = @request.order
    if @request.order.engineer_id == current_engineer.id
      @order.destroy
      redirect_to "/requests/#{@order.request_id}"
    else
      redirect_to "/requests/#{@order.request_id}"
    end
    
  end
  
  
end
