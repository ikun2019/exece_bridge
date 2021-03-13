class RatingsController < ApplicationController

  def new
    @rating = Rating.new
    @engineer = Engineer.find(params[:engineer_id])
  end
  
  def create
    @engineer = Engineer.find(params[:engineer_id])
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to engineer_rating_path(@engineer.id, @rating.id)
    else
      render action: :new
    end
  end

  def show
    @engineer = Engineer.find(params[:engineer_id])
  end
  
  
  private
  def rating_params
    params.require(:rating).permit(:rate, :customer_comment).merge(customer_id: current_customer.id, engineer_id: @engineer.id)
  end
  
end
