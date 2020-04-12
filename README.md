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
![sign-up](https://user-images.githubusercontent.com/55982558/79059132-a1925980-7cb1-11ea-8394-60e5f1bcf62d.gif)

- sessionを用いて複数のページの変遷可能な実装をしました。

### SNSアカウントでのログイン機能
![sns](https://user-images.githubusercontent.com/55982558/79059299-3a75a480-7cb3-11ea-8ad4-7314dbb0aa47.gif)
- gem omniauthを用いて外部APIからユーザー情報を取得しました。
- SNS認証の場合はgem deviseの機能を用いてパスワードを自動生成するようにしました。
```
  def create
  if session[:provider].present? && session[:uid].present?
    password = Devise.friendly_token.first(7)
```
- ※ドメイン取得をしていないため、ローカル環境のみで動作します。

<!-- 


### ユーザーログアウト機能

### ユーザー編集機能


## 商品出品

### 商品新規出品機能

![メルカリ商品出品 mov](https://user-images.githubusercontent.com/53807858/67621894-424da380-f84f-11e9-8749-e4d14e15d1bd.gif)

- 商品情報を保存する**Productテーブル**と写真を保存する**Imageテーブル**のレコードを1ページで作成するように実装しました。
  accepts_nested_attributes_forをmodelで定義し、1つのformで値を送れるように実装しました。

```
= form_for @product do |f|
      ~省略〜
  = f.fields_for :image do |image|
    = image.label :image, for: "upload-image__btn" do
        = image.file_field :image, type: "file", name: "product[images_attributes][0][image]"
```

- jQueryを用いて、登録した写真のプレビューを見れるように実装しました。
  また写真の削除を[非同期での通信](https://github.com/nakanishikeita03/freemarket_sample_58a/blob/master/app/assets/javascripts/sell.js)で可能にしました。

![メルカリ商品出品画像 mov](https://user-images.githubusercontent.com/53807858/67622556-213c8100-f856-11e9-9dd9-a4efed4b496b.gif)

### 商品編集機能
### 商品削除機能
### トップページ(products#index)のビュー作成

## その他 -->

### DB設計

<!-- ![メルカリER図 (1)](https://user-images.githubusercontent.com/53807858/67630498-01e03b00-f8cc-11e9-8197-c37aba2f4a82.png) -->

### スクラムマスター
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

<!-- # README

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|unique: false|
|mail|string|unique: false|
|password|string|unique: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_num|integer|null: false|
|authentication_code|string|null: false|
|profiletext|string|null: false|
### Association
- has_many :products　
- has_one :address, dependent: :destroy
- has_many :payments

## Adressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building_name|string|
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
|delivery_area|integer|null: false|
|delivery_days|integer|null: false|
|price|integer|null: false|
|status|string|null: false|
|user|references|null: false, foreign_key: true|
|customer|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :product_image

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :products

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products


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
|card_num|integer|null: false|
|use_year|integer|null: false|
|use_month|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

|security_code|integer|null: false| -->