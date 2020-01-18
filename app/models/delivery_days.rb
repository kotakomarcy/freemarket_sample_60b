class Delivery_days < ActiveHash::Base
  self.data = [
      {id: 1, name: '数時間以内'}, {id: 2, name: '1~2日で発送'}, {id: 3, name: '2~3日で発送'},
      {id: 4, name: '4~7日で発送'}, {id: 5, name: '8~100日で発送'},
  ]
end