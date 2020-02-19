class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def profile
  end

  def identification 
    @address= Address.find_by(user_id: current_user.id)  
  end

  def card
    @card = Card.find_by(user_id: current_user.id)
    if @card.present?
    Payjp.api_key = "sk_test_09c484c2295eb1744967f104"
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
end
