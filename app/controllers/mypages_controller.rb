class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def profile
  end

end
