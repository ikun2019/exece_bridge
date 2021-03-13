class CardsController < ApplicationController
  before_action :authenticate_engineer!

  require 'payjp'

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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params[:token].blank?
      redirect_to action: :new
    else
      # 顧客IDから顧客データの生成
      customer = Payjp::Customer.create(
        card: params[:token]
      )
      @card = Card.new(
        engineer_id: current_engineer.id,
        payjp_customer_id: customer.id,
        card_id: customer.default_card
      )
      if @card.save
        pay
      else
        flash[:alert] = "カード情報を登録できませんでした"
        redirect_to action: :new
      end
    end
  end

  def pay
    card = Card.find_by(engineer_id: current_engineer.id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    subscription = Payjp::Subscription.create(
      :customer => card.payjp_customer_id,
      :plan => plan,
      metadata: {engineer_id: current_engineer.id}
    )
    current_engineer.update(subscription_id: subscription.id, premium: true)
    flash[:alert] = "会員登録が完了しました"
    redirect_to engineers_path
  end
  
  def edit
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @card = Card.find(params[:id])
  end
  
  def update
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @card = Card.find(params[:id])
    customer = Payjp::Customer.retrieve(@card.payjp_customer_id)
    card = customer.cards.retrieve(@card.card_id)
    card.delete

    customer.cards.create(
      card: params[:token]
    )
    @card.update(card_id: params[:card_token])
    redirect_to engineers_path
  end
end
