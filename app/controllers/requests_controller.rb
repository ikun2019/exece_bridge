class RequestsController < ApplicationController
  before_action :authenticate_engineer!
  before_action :authenticate_customer_original!, only: [:show, :new, :create, :completed]

  def index
    @requests = Request.all.order("created_at DESC").includes(:customer)
  end
  
  def show
    if current_engineer.premium
      true
    else
      redirect_to requests_path, notice: "こちらのページを閲覧するには有料会員に登録する必要があります。"
    end
    
    @request = Request.find(params[:id])
    @agree = Agreement.new

    if engineer_signed_in?
      @applied = @request.engineer_apply(current_engineer.id)
    end
    @order = Order.new

    if customer_signed_in?
      @reply = @request.orders.present?
    end

    if customer_signed_in? && @request.agreements.where(answer: true).present?
      @engineer = @request.agreements.find_by(answer: true).engineer.nickname
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
  
  # def engineer_singin?
  #   if engineer_signed_in?
  #     true
  #   else
  #     redirect_to new_engineer_session_path
  #   end
  # end
  
  # def engineer_premium?
  #   if current_engineer.premium
  #     before_action :authenticate_engineer!, only: [:index, :show]
  #   else
  #     before_action :authenticate_engineer!, only: [:index]
  #   end
  # end
  
  
  def authenticate_customer_original!
    if customer_signed_in?
      true
    else
      root_path
    end
  end
  
  
end