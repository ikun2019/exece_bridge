class OrdersController < ApplicationController
  before_action :authenticate_engineer!
  def create
    @request = Request.find(params[:request_id])
    @order = Order.new(request_id: @request.id, engineer_id: current_engineer.id)
    if @request.orders.where(engineer_id: current_engineer.id).present?
      redirect_to "/requests/#{@order.request_id}"
    else
      @order.save
      redirect_to "/requests/#{@order.request_id}"
    end
  end

  def destroy
    @request = Request.find(params[:request_id])
    @order = @request.orders.find_by(engineer_id: current_engineer.id)
    @order.destroy
    redirect_to "/requests/#{@request.id}"
  end
  
end
