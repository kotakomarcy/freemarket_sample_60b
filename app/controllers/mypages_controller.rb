class MypagesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_address, only:[:address]

  def index
    @user = current_user
  end

  def profile
  end

  def address
  #  @address = Addresses.find_by(user_id: current_user.id)
  end


  private
    def set_address
      params.permit(:zip_code, :prefecture_id, :city, :block, :building_name).merge(user_id: current_user.id)
    end
end
