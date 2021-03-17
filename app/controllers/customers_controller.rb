class CustomersController < ApplicationController

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
    @user = current_customer
  end
  
  def update
    @user = current_customer
    @user.update(update_params)
    redirect_to customer_path(current_customer)
  end

  private
  def update_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :image)
  end
  
  
end
