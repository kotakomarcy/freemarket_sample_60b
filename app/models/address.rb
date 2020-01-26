class Address < ApplicationRecord
  belongs_to :user, optional: true

  # 各種バリデーション追加

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
