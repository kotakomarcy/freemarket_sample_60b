class Product < ApplicationRecord
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true
end
