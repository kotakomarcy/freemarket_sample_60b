class Product < ApplicationRecord
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :delivery_charge, presence:true
  validates :delivery_way, presence: true
  validates :delivery_area, presence: true
  validates :delivery_days, presence: true
  validates :price, presence: true
  validates :status, presence: true
end
