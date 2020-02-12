class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  has_many :payments
  accepts_nested_attributes_for :address
  validates_associated :address

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birthday, presence: true
  validates :phone_num, presence: true

end
