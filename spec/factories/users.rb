FactoryBot.define do

  factory :user do
    nickname              {"こたこま"}
    last_name             {"増川"}
    first_name            {"英明"}
    last_name_kana        {"マシカワ"}
    first_name_kana       {"ヒデアキ"}
    birthday              {"1985-10-06"}
    email                 {"mamama@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    phone_num             {"09000000000"}
  end

end