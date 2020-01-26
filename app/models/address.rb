class Address < ApplicationRecord
  belongs_to :user, optional: true

  # 各種バリデーション追加

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :zip_code, presence: true, format: { with: /\A\d{3}\-?d{4}\z/ }
  validates :prefectur, presence: true
  validates :city, presence: true
  validates :block, presence: true
  
end
