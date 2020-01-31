# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    # Userインスタンス作成
    @user = User.new(sign_up_params)
  end

  def new_phone
    # userデータをsessionに保存
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:last_name] = params[:user][:last_name]
    session[:first_name] = params[:user][:first_name]
    session[:last_name_kana] = params[:user][:last_name_kana]
    session[:first_name_kana] = params[:user][:first_name_kana]
    session[:birth_year] = params[:user][:birth_year]
    session[:birth_month] = params[:user][:birth_month]
    session[:birth_day] = params[:user][:birth_day]
    # binding.pry
    @user = User.new
    render :new_phone
  end

  def new_address
    # userデータをsessionに保存
    session[:phone_num] = params[:user][:phone_num]
    @user = User.new
    @user.build_address
    # binding.pry
    render :new_address
  end

  def new_payment
    # addressデータをsessionに保存するパターン
    session[:last_name] = params[:user][:last_name_kana]
    session[:first_name] = params[:user][:first_name_kana]
    session[:last_name_kana] = params[:user][:last_name_kana]
    session[:first_name_kana] = params[:user][:first_name_kana]
    session[:zip_code] = user_params[:address_attributes][:zip_code]
    session[:prefecture] = user_params[:address_attributes][:prefecture]
    session[:city] = user_params[:address_attributes][:city]
    # binding.pry
    session[:block] = user_params[:address_attributes][:block]
    session[:phone_num] = params[:user][:phone_num]
    # binding.pry
    # redirect_to controller: 'payments', action: 'new'
    # @user = User.new
    # @user.build_payment
    render :new_payment
  end
# -----ここまでOK------

  def create
    @user = User.new(
      password_confirmation: session[:password_confirmation],
      name: user_params[:name],
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
    )
    @user.build_address(user_params[:address_attributes])
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_signup_done
    else
      render '/users/signup/registration'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      :uid,
      :provider,
      address_attributes: [:id, :zip_code, :prefecture, :city, :block]
    )
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
