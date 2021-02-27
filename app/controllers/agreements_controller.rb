class AgreementsController < ApplicationController

  def create
    @request = Request.find(params[:request_id])
    @agreement = Agreement.new(agreement_params)
    @agreement.save
    redirect_to request_path(@request.id)
  end

  private
  def agreement_params
    params.require(:agreement).permit(:engineer_id).merge(request_id: @request.id)
  end
  
end
