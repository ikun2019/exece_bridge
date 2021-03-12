class CardsController < ApplicationController

  def index
    @card = Card.new
  end

  def plan
    Payjp::Plan.create(
      :amount => 1200,
      :interval => 'month',
      :billing_day => 27,
      :currency => 'jpy',
    )
  end  
  
  def create
    if params[:token].blank?
      redirect_to action: :new
    else
      engineer_id = current_engineer.id
      customer = Payjp::Customer.create(
        card: params[:token]
      )
      @card = Card.new(engineer_id: engineer_id, payjp_customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        pay
      else
        flash[:alert] = "カード情報を登録できませんでした"
        redirect_to action: :new
      end
    end
  end

  def pay
    card = Card.where(engineer_id: current_engineer.id).first
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    subscription = Payjp::Subscription.create(
      :customer => card.payjp_customer_id,
      :plan => plan,
      metadata: {engineer_id: current_engineer.id}
    )
    current_engineer.update(subscription_id: subscription.id, premium: true)
    flash[:alert] = "会員登録が完了しました"
    redirect_to root_path
  end
  
  
end
