class Address < ApplicationRecord
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :zip_code, presence: true, format: { with: /\A\d{3}\-?\d{4}\z/  }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block, presence: true

end
