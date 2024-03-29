class RequestsController < ApplicationController
  before_action :authenticate_engineer!, only: [:show], if: :engineer_signed_in?
  before_action :authenticate_customer!, only: [:show, :new, :create, :completed], if: :customer_signed_in?

  def index
    @requests = Request.all.order("created_at DESC").includes(:customer)
  end
  
  def show
    @request = Request.find(params[:id])
    @agree = Agreement.new

    if engineer_signed_in?
      if current_engineer.premium
        true
      else
        redirect_to requests_path, notice: "こちらのページを閲覧するには有料会員に登録する必要があります。"
      end
      @applied = @request.engineer_apply(current_engineer.id)
    end
    @order = Order.new

    if customer_signed_in?
      @reply = @request.orders.present?
    end

    if customer_signed_in? && @request.agreements.where(answer: true).present?
      @engineer = @request.agreements.find_by(answer: true).engineer
    end
    
  end
  

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to request_path(@request)
    else
      render action: :new
    end
  end

  def completed
    @completed_requests = current_customer.completes.where(conclusion: true)
  end
  
  private
  def request_params
    params.require(:request).permit(:title, :content, :budget_id, :term_id, :approach_id, :other).merge(customer_id: current_customer.id)
  end


end