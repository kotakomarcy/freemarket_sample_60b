class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 各種バリデーション追加
  
  has_one :address, dependent: :destroy
  has_many :payments

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, format: { /^[一-龥]+$/ }
  validates :first_name, presence: true, format: { /^[一-龥]+$/ }
  validates :last_name_kana, presence: true, format: { /^([ァ-ン]|ー)+$/ }
  validates :first_name_kana, presence: true, format: { /^([ァ-ン]|ー)+$/ }
  validates :first_name_kana, presence: true, format: { /^([ァ-ン]|ー)+$/ }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true

end
