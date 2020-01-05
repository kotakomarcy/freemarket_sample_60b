# README

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
### Association
- has_many :products　
- has_one :address, dependent: :destroy
- has_one :payments

## Adressesテーブル
|Column|Type|Options|
|------|----|-------|
|profiletext|string|null: false|
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
<!-- |security_code|integer|null: false| -->
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

