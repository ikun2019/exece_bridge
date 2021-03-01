class AgreementsController < ApplicationController

  def create
    @request = Request.find(params[:request_id])
    @agreement_complete = AgreementComplete.new(agreement_complete_params)

    if @agreement_complete.valid?
      @agreement_complete.save
      redirect_to request_path(@request.id), notice: "依頼が確定しました。エンジニアにメールアドレスが共有されます。"
    end
    
  end

  private
  def agreement_complete_params
    params.permit(:order_id, :answer, :engineer_id, :conclusion).merge(request_id: @request.id)
  end
  
end
