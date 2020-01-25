require 'rails_helper'

describe Product do
  describe '#create' do
    it "全て入力すれば登録可能" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "nameが空の場合、エラー" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "descriptionが空の場合、エラー" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "conditionが空の場合、エラー" do
      product = build(:product, condition: "")
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    it "delivery_chargeが空の場合、エラー" do
      product = build(:product, delivery_charge: "")
      product.valid?
      expect(product.errors[:delivery_charge]).to include("can't be blank")
    end

    it "delivery_wayが空の場合、エラー" do
      product = build(:product, delivery_way: "")
      product.valid?
      expect(product.errors[:delivery_way]).to include("can't be blank")
    end

    it "delivery_areaが空の場合、エラー" do
      product = build(:product, delivery_area: "")
      product.valid?
      expect(product.errors[:delivery_area]).to include("can't be blank")
    end

    it "delivery_daysが空の場合、エラー" do
      product = build(:product, delivery_days: "")
      product.valid?
      expect(product.errors[:delivery_days]).to include("can't be blank")
    end

    it "priceが空の場合、エラー" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "statusが空の場合、エラー" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end
  end
end