class EngineersController < ApplicationController

  def index
    
  end

  def apply
    @ordered_requests = current_engineer.requests
  end
  
  def replied
    @replied_orders = current_engineer.agreements
  end
  
end
