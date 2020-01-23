FactoryBot.define do
  
  factory :product do
    name             { "黒のジャケット" }
    description      { "３年前に買いましたが、着ないのでお譲りします" }
    size             { "2" }
    condition        { "2" }
    delivery_charge  { "1" }
    delivery_way     { "4" }
    delivery_area    { "" }
    delivery_days    { "2" }
    price            { "5000" }
    status           { "" }
    user_id          { "1" }
  end
end