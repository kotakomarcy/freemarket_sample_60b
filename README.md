# freemarket_sample_60b

プログラミングスクール『テックキャンプ』の最終課題で某フリーマーケットサービスのクローンサイトを作成しました。約3ヶ月間、2人チーム(当初4人)でアジャイル開発を行いました。

# リンク
http://18.177.19.65/

Basic認証をかけています。ご覧の際は以下のIDとPassを入力してください。
- Basic認証
  - ID: admin
  - Pass: 1234

# テストユーザー

- 購入者用アカウント
  - メールアドレス: buyer@buyer.com
  - パスワード: buyer123

- 購入用カード情報
  - 番号：4242424242424242
  - 期限：12/22
  - セキュリティコード：123

- 出品用アカウント
  - メールアドレス名: seller@seller.com
  - パスワード: seller123

# kotakomarcyの担当箇所

## デプロイ
- デプロイ作業
   - http://18.177.19.65/ へアクセス手段の構築を実装しました。
   - Capistranoを利用した自動デプロイを実装しました。

## ユーザー

### ユーザー新規登録
<img src="https://user-images.githubusercontent.com/55982558/79059132-a1925980-7cb1-11ea-8394-60e5f1bcf62d.gif" width=“450px”>

- sessionを用いて複数のページの変遷可能な実装をしました。


### SNSアカウントでのログイン機能
<img src="https://user-images.githubusercontent.com/55982558/79059299-3a75a480-7cb3-11ea-8ad4-7314dbb0aa47.gif" width=“450px”>

- gem omniauthを用いて外部APIからユーザー情報を取得しました。
- SNS認証の場合はgem deviseの機能を用いてパスワードを自動生成するようにしました。
```
  def create
  if session[:provider].present? && session[:uid].present?
    password = Devise.friendly_token.first(7)
```
- ※URL上ではSSL通信が必要なため、遷移できないようにしています。


### ユーザーマイページ
<img src="https://user-images.githubusercontent.com/55982558/79059418-c805c400-7cb4-11ea-95d6-98dc36802521.gif" width=“450px”>

- ユーザーログイン後のマイページを作成しました。
- ログイン後、マイページボタンより確認いただけます。


### ユーザープロフィール
<img src="https://user-images.githubusercontent.com/55982558/79059436-f5527200-7cb4-11ea-9ff6-ada1ea1cd3a1.gif" width=“450px”>

- ログインユーザーのプロフィール変更画面を作成しました。
- マイページのプロフィールより確認いただけます。
- ニックネームと、自己紹介テキストの登録・変更を行うことができます。


### ユーザーログアウト
<img src="https://user-images.githubusercontent.com/55982558/79059446-1d41d580-7cb5-11ea-8516-54971f0baea7.gif" width=“450px”>

- ログインユーザーのログアウト機能を作成しました。
- マイページのログアウトボタンより確認いただけます。


### クレジットカード登録
<img src="https://user-images.githubusercontent.com/55982558/79059471-6c880600-7cb5-11ea-8dd9-fe6873448370.gif" width=“450px”>

- PAYJPを用いてユーザーのクレジットカード登録画面を作成しました。
- テストカードを用いて登録をすることができます。

## 商品

### 商品購入確認
<img src="https://user-images.githubusercontent.com/55982558/79059511-e02a1300-7cb5-11ea-8599-9ec851c9949b.gif" width=“450px”>

- 購入者の商品購入画面を作成しました。
- 購入者アカウントにて、トップページの商品を選択していただき、購入確認画面、購入完了画面を確認いただけます。


## スクラムマスター
  - スクラムマスターとして、チーム内の進捗状況の確認や、今後の実装方針について提案、実装していきました。

# 使用技術一覧
- Ruby 2.5.1
- Ruby on Rails 5.2.4
- MySQL 5.6.43
- Haml 5.1.2
- jQuery 3.4.1
- AWS
  - EC2
  - ELB
  - S3
- Github


## DB設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|unique: false|
|email|string|unique: false|
|encrypted_password|string|unique: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|phone_num|integer|null: false|
|authentication_code|string|null: false|
|profile_text|string|
### Association
- has_many :sns_credentials
- has_many :products
- has_one :address, dependent: :destroy
- has_many :payments

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## Adressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string|null: false|
|prefecture_id|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building_name|string|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|size|integer|
|condition|integer|null: false|
|delivery_charge|integer|null: false|
|delivery_way|integer|null: false|
|prefecture_id|integer|null: false|
|delivery_days|integer|null: false|
|price|integer|null: false|
|status|string|default: 0,null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :product_image

## Product_images
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|image|string|
### Association
- belongs_to :product

## Paymentsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|integer|null: false|
|card_id|integer|null: false|
|token|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user