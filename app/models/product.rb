class Product < ApplicationRecord
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :condition, presence: true
  validates :delivery_charge, presence:true
  validates :delivery_way, presence: true
  validates :delivery_area, presence: true
  validates :delivery_days, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :status, presence: true

  enum condition: { '新品、未使用': 1, '未使用に近い': 2, '目立った傷や汚れなし': 3, 'やや傷や汚れあり': 4, '全体的に状態が悪い': 5 }
  enum delivery_way:  { '未定': 1 }
  enum delivery_charge: { '送料込み（出品者負担）': 1, '着払い（購入者負担）': 2 }
  enum delivery_days: { '１〜２日で発送': 1, '２〜４日で発送': 2, '４〜７日で発送': 3 }
end
