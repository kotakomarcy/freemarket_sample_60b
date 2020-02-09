require 'rails_helper'

describe Address do
  describe '#create' do
    it "zip_codeが空では登録不可" do
      address = build(:address, zip_code: "")
      address.valid?
      expect(address.errors[:zip_code]).to include("を入力してください")
    end
    it "zip_codeがdate型データXXX-XXXXではない場合登録不可" do
      address = build(:address, zip_code: "1111-1111")
      address.valid?
      expect(address.errors[:zip_code]).to include("は不正な値です")
    end
    it "prefecture_idが空では登録不可" do
      address = build(:address, prefecture_id: "")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end
    it "cityが空では登録不可" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end
    it "blockが空では登録不可" do
      address = build(:address, block: "")
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end
  end
end