require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe '#create' do
    it "providerが空では登録不可" do
      sns_credential = build(:provider, provider: "")
      sns_credential.valid?
      expect(sns_credential.errors[:provider]).to include("を入力してください")
    end
    it "uidが空では登録不可" do
      sns_credential = build(:uid, uid: "")
      sns_credential.valid?
      expect(sns_credential.errors[:uid]).to include("を入力してください")
    end
  end
end
