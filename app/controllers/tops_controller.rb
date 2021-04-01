class TopsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  def index
    
  end

  def engineers
    @engineers = Engineer.where(study_id: 0).includes(:ratings)
  end

  def engineer_show
    @engineer = Engineer.find(params[:top_id])
    if @engineer.ratings.present?
      @rate = @engineer.ratings.average(:rate).round
      @rate_count = @engineer.ratings.where.not(rate: nil).count
    end
    if @engineer.answers.where.not(rate: nil).present?
      @engineer_rate = @engineer.answers.average(:rate).round
      @engineer_rate_count = @engineer.answers.where.not(rate: nil).count
    end
    
  end
  
  
end
