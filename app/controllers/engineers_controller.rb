class EngineersController < ApplicationController

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
  
  
end
