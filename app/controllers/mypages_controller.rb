class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_params,only: [:update]
  before_action :set_user,only: [:index, :profile, :update]

  def index
  end

  def profile
  end


  def update
    if @user.update(profile_params)
      redirect_to profile_mypages_path
    else
      render :profile
    end
  end


  def identification 
    @address= Address.find_by(user_id: current_user.id)  
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile_text)
  end

  def set_user
    @user = current_user
  end

end
