class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def index
    
  end

  def status
    @requests = current_customer.requests
    @requests.each do |request|
      if request.complete.present?
        @completed = request.complete.conclusion
      end
    end
  end

  def edit
    @user = Customer.find(params[:id])
  end
  
  def update
    @user = Customer.find(params[:id])
    if current_customer == @user
      if @user.update(update_params)
        redirect_to customer_path(current_customer)
      else
        flash.now[:danger] = "ユーザー情報の編集に失敗しました"
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  private
  def update_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :image)
  end

end
