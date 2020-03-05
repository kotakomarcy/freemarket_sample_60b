class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_address, only:[:edit, :update]

  def edit
    @user = current_user
  end

  def update
    if @address.update(set_address)
      redirect_to mypages_path
    else
      render :edit
    end
  end

  private
    def set_address
      params.require(:address).permit(:zip_code, :prefecture_id, :city, :block, :building_name).merge(user_id: current_user.id)
    end

    def find_address
      @address = Address.find_by(user_id: current_user.id)
    end

end
