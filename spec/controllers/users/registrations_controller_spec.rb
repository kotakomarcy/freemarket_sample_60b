require 'rails_helper'

describe Users::RegistrationsController do
  describe "GET #new" do
    it "新しいユーザーが割り当てられる" do
      expect(assigns(:user)).to be_a_new(User)
    end
  end
end