class RatingsController < ApplicationController

  def new
    @rating = Rating.new
    @engineer = Engineer.find(params[:engineer_id])
  end
  
  def create
    @engineer = Engineer.find(params[:engineer_id])
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to completed_requests_path
    else
      render action: :new
    end
  end

  def edit
    @engineer = Engineer.find(params[:engineer_id])
    @rating = Rating.find(params[:id])
  end
  
  def update
    Rating.update(update_params)
    redirect_to completed_requests_path
  end
  
  private
  def rating_params
    params.require(:rating).permit(:rate, :customer_comment).merge(customer_id: current_customer.id, engineer_id: @engineer.id)
  end

  def update_params
    params.require(:rating).permit(:rate, :customer_comment)
  end
  
  
end
