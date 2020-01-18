class Delivery_price < ActiveHash::Base
  self.data = [
      {id: 1, name: '企業支払い(会社負担)'}, {id: 2, name: '送料込み(出品者負担)'}, {id: 3, name: '着払い(購入者負担)'}
  ]
end