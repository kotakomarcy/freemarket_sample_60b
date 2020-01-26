class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 各種バリデーション追加
  
  has_one :address, dependent: :destroy
  has_many :payments

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true

end
