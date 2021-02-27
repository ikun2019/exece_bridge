class CustomersController < ApplicationController

  def index
    
  end

  def status
    @requests = current_customer.requests
  end
  
  
end
