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

    it "nameが40文字以上の時、エラー" do
      product = build(:product, name: "name:abcdefghijklmnopqrstuvwxyz1234567890")
      product.valid?
      expect(product.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "descriptionが空の場合、エラー" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "descriptionが1000文字以上の時、エラー" do
      product = build(:product, 
        description: "以下、1行につき92文字を羅列しており、全て50音を1つづつずらし、5行分作成してある。単純にテストのためであり、数えるのめんどくさいから半分以降はコピペした。
                      1:あいうえお、いうえおあ、うえおあい、えおあいう、おあいうえ、かきくけこ、きくけこか、くけこかき、けこかきく、こかきくけ、さしすせそ、しすせそさ、すせそさし、せそさしす、そさしすせ。
                      2:たちつてと、ちつてとた、つてとたち、てとたちつ、とたちつて、なにぬねの、にぬねのな、ぬねのなに、ねのなにぬ、のなにぬね、はひふへほ、ひふへほは、ふへほはひ、へほはひふ、ほはひふへ。
                      3:まみむめも、みむめもま、むめもまみ、めもまみむ、もまみむめ、やいゆえよ、いゆえよや、ゆえよやい、えよやいゆ、よやいゆえ、らりるれろ、りるれろら、るれろらり、れろらりる、ろらりるれ。
                      4:わいうえを、いうえをわ、うえをわい、えをわいう、をわいうえ、がぎぐげご、ぎぐげごが、ぐげごがぎ、げごがぎぐ、ごがぎぐげ、ざじずぜぞ、じずぜぞざ、ずぜぞざじ、ぜぞざじず、ぞざじずぜ。
                      5:だぢづでど、ぢづでどだ、づでどだぢ、でどだぢづ、どだぢづで、ばびぶべぼ、びぶべぼば、ぶべぼばび、べぼばびぶ、ぼばびぶべ、ぱぴぷぺぽ、ぴぷぺぽぱ、ぷぺぽぱぴ、ぺぽぱぴぷ、ぽぱぴぷぺ。
                      6:あいうえお、いうえおあ、うえおあい、えおあいう、おあいうえ、かきくけこ、きくけこか、くけこかき、けこかきく、こかきくけ、さしすせそ、しすせそさ、すせそさし、せそさしす、そさしすせ。
                      7:たちつてと、ちつてとた、つてとたち、てとたちつ、とたちつて、なにぬねの、にぬねのな、ぬねのなに、ねのなにぬ、のなにぬね、はひふへほ、ひふへほは、ふへほはひ、へほはひふ、ほはひふへ。
                      8:まみむめも、みむめもま、むめもまみ、めもまみむ、もまみむめ、やいゆえよ、いゆえよや、ゆえよやい、えよやいゆ、よやいゆえ、らりるれろ、りるれろら、るれろらり、れろらりる、ろらりるれ。
                      9:わいうえを、いうえをわ、うえをわい、えをわいう、をわいうえ、がぎぐげご、ぎぐげごが、ぐげごがぎ、げごがぎぐ、ごがぎぐげ、ざじずぜぞ、じずぜぞざ、ずぜぞざじ、ぜぞざじず、ぞざじずぜ。
                      0:だぢづでど、ぢづでどだ、づでどだぢ、でどだぢづ、どだぢづで、ばびぶべぼ、びぶべぼば、ぶべぼばび、べぼばびぶ、ぼばびぶべ、ぱぴぷぺぽ、ぴぷぺぽぱ、ぷぺぽぱぴ、ぺぽぱぴぷ、ぽぱぴぷぺ。
                      1行目だけ、80文字")
      product.valid?
      expect(product.errors[:description]).to include("is too long (maximum is 1000 characters)")
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

    it "priceが300以下の場合、エラー" do
      product = build(:product, price: "299")
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "priceが9999999以上の場合、エラー" do
      product = build(:product, price: "10000000")
      product.valid?
      expect(product.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "statusが空の場合、エラー" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end
  end
end