FactoryBot.define do
  
  factory :product do
    name             { "黒のジャケット" }
    description      { "３年前に買いましたが、着ないのでお譲りします" }
    size             { "Mサイズ" }
    condition        { "未使用に近い" }
    delivery_charge  { "送料込み（出品者負担）" }
    delivery_way     { "クロネコヤマト" }
    delivery_area    { "7" }
    delivery_days    { "２〜４日で発送" }
    price            { "5000" }
    status           { "出品中" }
    user_id          { "1" }
  end
end