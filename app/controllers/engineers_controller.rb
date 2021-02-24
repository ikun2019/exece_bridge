class EngineersController < ApplicationController

  def index
    
  end

  def apply
    @orders = current_engineer.orders
  end
  
  
end
