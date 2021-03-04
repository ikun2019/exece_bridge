class AgreementsController < ApplicationController

  def create
    @request = Request.find(params[:request_id])
    @agreement_complete = AgreementComplete.new(agreement_complete_params)

    if @agreement_complete.valid?
      @agreement_complete.save
    end
    redirect_to request_path(@request.id)
  end

  private
  def agreement_params
    params.permit(:engineer_id, :order_id, :answer).merge(request_id: @request.id)
  end
  def agreement_complete_params
    params.permit(:order_id, :answer, :engineer_id, :conclusion).merge(request_id: @request.id)
  end
  
end
