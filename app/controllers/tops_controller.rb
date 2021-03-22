class TopsController < ApplicationController
  def index
    
  end

  def engineers
    @engineers = Engineer.all.includes(:ratings)
  end

  def engineer_show
    @engineer = Engineer.find(params[:top_id])
    @rate = @engineer.ratings.average(:rate).round
  end
  
  
end
