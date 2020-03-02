class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_one :address, dependent: :destroy
  has_many :payments,dependent: :destroy
  accepts_nested_attributes_for :address
  validates_associated :address
  has_many :products
  has_many :sns_credentials

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birthday, presence: true
  validates :phone_num, presence: true

  # SNS認証用
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

end
