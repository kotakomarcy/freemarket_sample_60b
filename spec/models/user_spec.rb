require 'rails_helper'

describe User do
  describe '#create' do
    it "nicknameが空では登録不可" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "nicknameが21文字以上だと登録不可" do
      user = build(:user, nickname: "ましかわひであきましかわひであきましかわひ")
      user.valid?
      expect(user.errors[:nickname][0]).to include("は20文字以内で入力してください")
    end
    it "emailが空では登録不可" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailが重複すると登録不可" do
      create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it "emailが@を含まないと登録不可 " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end
    it "emailの@の前に文字がないと登録不可 " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end
    it "emailの@の後に文字がないと登録不可" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end
    it "passwordが空だと登録不可" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが6文字未満だと登録不可" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end
    it "password_confirmationが空だと登録不可" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
    it "last_nameが空だと登録不可" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "last_nameが16文字以上だと登録不可" do
      user = build(:user, last_name: "増川増川増川増川増川増川増川増川")
      user.valid?
      expect(user.errors[:last_name][0]).to include("は15文字以内で入力してください")
    end
    it "last_nameに漢字以外が含まれると登録不可 " do
      user = build(:user, last_name: "増川a")
      user.valid?
      expect(user.errors[:last_name][0]).to include("は不正な値です")
    end
    it "first_nameが空だと登録不可" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "first_nameが16文字以上だと登録不可" do
      user = build(:user, first_name: "増川増川増川増川増川増川増川増川")
      user.valid?
      expect(user.errors[:first_name][0]).to include("は15文字以内で入力してください")
    end
    it "first_nameに漢字以外が含まれると登録不可 " do
      user = build(:user, first_name: "増川a")
      user.valid?
      expect(user.errors[:first_name][0]).to include("は不正な値です")
    end
    it "last_name_kanaが空だと登録不可" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end
    it "last_name_kanaが16文字以上だと登録不可" do
      user = build(:user, last_name_kana: "アアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("は15文字以内で入力してください")
    end
    it "last_name_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, last_name_kana: "カナa")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("は不正な値です")
    end
    it "first_name_kanaが空だと登録不可" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "first_name_kanaが16文字以上だと登録不可" do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("は15文字以内で入力してください")
    end
    it "first_name_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, first_name_kana: "カナa")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("は不正な値です")
    end
    it "birthdayが空だと登録不可" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
    it "birthdayがdate型データXXXX-XX-XXではない場合登録不可 " do
      user = build(:user, birthday: 1989)
      user.valid?
      expect(user.errors[:birthday][0]).to include("は不正な値です")
    end
    it "phone_numが空だと登録不可 " do
      user = build(:user, phone_num: "")
      user.valid?
      expect(user.errors[:phone_num][0]).to include("を入力してください")
    end
    it "すべて満たしていれば登録可" do
      user = build(:user)
      expect(user).to be_valid
    end

  end
end