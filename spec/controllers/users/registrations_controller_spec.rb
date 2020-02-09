require 'rails_helper'


# RSpec.describe SignupController, type: :controller do
# end

describe Users::RegistrationsController do
  describe "GET #new" do
    it "リクエストが200になること" do
      get :new
      expect(response).to eq 200
    end

    it "新しいユーザーが割り当てられる" do
      expect(assigns(:user)).to be_a_new(User)
    end
    
    #describe "#new_validates" do
      #context "有効なデータの場合" do
        #subject {
          #user_params = atributes_for(:user)
          #post :new_validates, params: { user: user_params }
          #session: {

          #}
        #}
      #end

      #context "無効なデータの場合" do
        #subject {
          #user_params = atributes_for(:user)
          #post :new_validates, params: { user: user_params }
          #session: {

          #}
        #}
      #end
    #end
  end

  #describe "GET #new_phone" do
    #before do
      #user_params = atributes_for(:user)
      #session[:nickname] = user_params[:nickname]
      #session[:email] = user_params[:email]
      #session[:password] = user_params[:password]
      #session[:password_confirmation] = user_params[:password_confirmation]
      #session[:last_name] = user_params[:last_name]
      #session[:first_name] = user_params[:first_name]
      #session[:last_name_kana] = user_params[:last_name_kana]
      #session[:first_name_kana] = user_params[:first_name_kana]
      #session[:birth_year] = user_params[:birth_year]
      #session[:birth_month] = user_params[:birth_month]
      #session[:birth_day] = user_params[:birth_day]
    #end
  #end

  #describe "POST #create" do
    #context "有効なデータの場合" do
      #subject {
        #user_params = atributes_for(:user)
        #post :create
      #}
    #end
  #end
  
end