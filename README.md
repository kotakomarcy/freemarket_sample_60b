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

## Adressesテーブル
|Column|Type|Options|
|------|----|-------|
|plofiletext|string|null: false|
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
|description|string|null: false|
|size|string|
|condition|string|null: false|
|delivery_charge|string|null: false|
|delivery_way|string|null: false|
|delivery_area|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :categories, through: :products_categories

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :products, through: :products_categories

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products

## Products_Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|catergory_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
### Association
- has_many :products

## Products_images
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|image|string|
### Association
- belongs_to :product



## Paymentsテーブル
|Column|Type|Options|
|------|----|-------|
|card_num|integer|null: false|
|use_year|integer|null: false|
|use_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :product
- belongs_to :user

