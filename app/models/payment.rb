class Payment < ApplicationRecord
  belongs_to :user

  validates :card_num, presence: true, format: { /^[0-9]+$/ }
  validates :use_year, presence: true, format: { /^[0-9]+$/ }
  validates :use_month, presence: true, format: { /^[0-9]+$/ }

end
