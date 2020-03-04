class AddressesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    @address = Addresses.find_by(user_id: current_user.id)
  end

  def update
    @address = Address.find_by(user_id: current_user.id)
    if @address.update(set_address)
      redirect_to address_mypages_path
    else
      render :edit
    end
  end

  private
    def set_address
      params.permit(:zip_code, :prefecture_id, :city, :block, :building_name).merge(user_id: current_user.id)
    end

end
