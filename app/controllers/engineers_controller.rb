class EngineersController < ApplicationController
  before_action :authenticate_engineer!
  
  def index
    
  end

  def apply
    @ordered_requests = current_engineer.requests
  end
  
  def replied
    @unfinished_request = current_engineer.completes.where(conclusion: false)
  end

  def completed
    @completed_orders = current_engineer.completes.where(conclusion: true)
  end
  
  def edit
    @user = current_engineer
  end

  def update
    @user = current_engineer
    @user.update(update_params)
    redirect_to engineer_path(current_engineer)
  end
  
  private
  def update_params
    params.require(:engineer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :language, :profile)
  end
  
  
end
