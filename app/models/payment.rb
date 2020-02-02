class Payment < ApplicationRecord
  belongs_to :user

  # validates :card_num, presence: true, format: { with: /\A[0-9]+\z/ }
  # validates :use_year, presence: true, format: { with: /\A[0-9]+\z/ }
  # validates :use_month, presence: true, format: { with: /\A[0-9]+\z/ }

end
