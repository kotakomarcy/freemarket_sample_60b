class PaymentsController < ApplicationController
  require "payjp"

  def new
    payment = Payment.where(user_id: current_user.id)
    redirect_to action: "show" if payment.exists?
  end

  def pay
    Payjp.api_key = "sk_test_09c484c2295eb1744967f104"
    if params['payjpToken'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken'],
      metadata: {user_id: current_user.id}
      )
      @payment = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @payment.save
        redirect_to action: "show"
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "pay"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
 end


end
