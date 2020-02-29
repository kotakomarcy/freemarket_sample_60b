class PaymentsController < ApplicationController
  require "payjp"
  before_action :set_product, only:[:confirmation, :complete]
  before_action :authenticate_user!
  before_action :set_user, only:[:confirmation, :complete]
  before_action :card_information, only:[:show,:confirmation, :complete]
  before_action :create, only:[:complete]

  def new
    @payment = Payment.where(user_id: current_user.id)
    redirect_to action: "show" if @payment.exists?
  end

  def show
  end

  def pay
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @payment.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def create
    product = Product.find(card_params[:product_id])
    payment = Payment.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    amount:  product.price,
    customer: payment.customer_id,
    currency: 'jpy',
    )
    product[:status] = "売却済"
    product.save
  end

  def delete
    payment = Payment.where(user_id: current_user.id).first
    if payment.present?
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(payment.customer_id)
      customer.delete
      payment.delete
    end
      redirect_to action: "show"
  end

  def confirmation
    card_exist
  end

  def complete
  end

  def set_product
  end

  private
  def card_exist
    @payment = Payment.where(user_id: current_user.id).first
    redirect_to action: "show" if @payment.blank?
  end

  def card_params
    params.permit('payjp-token',:product_id)
  end

  def set_user
    @user = current_user
  end

  def card_information
    @payment = Payment.where(user_id: current_user.id).first
    if @payment.present?
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@payment.customer_id)
      @default_card_information = customer.cards.retrieve(@payment.card_id)
    end
  end

  def set_product
    @product = Product.find(params[:product_id])
    @address = Address.find_by(user_id: current_user.id)
  end

end
