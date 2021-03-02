class AgreementsController < ApplicationController

  def create
  end

  private
  def agreement_complete_params
    params.permit(:order_id, :answer, :engineer_id, :conclusion).merge(request_id: @request.id)
  end
  
end
