class PaymentsController < ApplicationController
  require "payjp"
  
  def new
    @payment = Payment.where(user_id: current_user.id)
    redirect_to action: "show" if @payment.exists?
  end

  def show
    @payment = Payment.where(user_id: current_user.id).first
    if @payment.blank?
    else
      Payjp.api_key = "sk_test_09c484c2295eb1744967f104"
      customer = Payjp::Customer.retrieve(@payment.customer_id)
      @default_card_information = customer.cards.retrieve(@payment.card_id)
    end
  end

  def pay
    Payjp.api_key = "sk_test_09c484c2295eb1744967f104"
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

  def delete
    payment = Payment.where(user_id: current_user.id).first
    if payment.blank?
    else
      Payjp.api_key = "sk_test_09c484c2295eb1744967f104"
      customer = Payjp::Customer.retrieve(payment.customer_id)
      customer.delete
      payment.delete
    end
      redirect_to action: "show"
  end

  def confirmation
    @product = Product.find(params[:product_id])
    @addresses = Address.find_by(user_id: current_user.id)
    card_information
  end

  def complete
    @product = Product.find(params[:product_id])
    @addresses = Address.find_by(user_id: current_user.id)
    card_information
  end

  private
  def card_exist
    @payment = Payment.where(user_id: current_user.id).first
    redirect_to action: "show" if @payment.blank?
  end

  def card_params
    params.permit('payjp-token',:product_id)
  end
  
end
