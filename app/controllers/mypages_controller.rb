class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def profile
  end

  def address
    @user = current_user
    @address = Address.find_by(user_id: current_user.id)
  end

  def address_update
    if @address.update(set_address)
      redirect_to address_mypages_path
    else
      render :address
    end
  end

  private
    def set_address
      params.permit(:zip_code, :prefecture_id, :city, :block, :building_name).merge(user_id: current_user.id)
    end
end
