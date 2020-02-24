class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def profile
  end

  def identification 
    @address= Address.find_by(user_id: current_user.id)  
  end

end
