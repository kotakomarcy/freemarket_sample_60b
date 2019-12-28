# README

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false|
|password|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|phone_num|string|null: false|
|authentication_code|string|null: false|
|plofiletext|string|null: false|
|zip_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building_name|string|null: false|
### Association
- belongs_to :user
- has_many :products, :dependent => destroy
- has_one :address, :dependent => destroy
- has_one :profile, :dependent => destroy
- has_many :byuing_list, :dependent => destroy
- has_many :selling_list, :dependent => destroy
- has_many :reference, :dependent => destroy
- has_many :fovorite, :dependent => destroy




## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|string|null: false|
|categories|string|null: false|
|size|string|null: false|
|condition|string|null: false|
|delivery_charge|string|null: false|
|delivery_way|string|null: false|
|delivery_area|string|null: false|
|delivery_days|string|null: false|
|price|string|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- has_many :products
- has_many :buying_coment_id, :refrence, :null: false
- has_many :product_image_id, :refrence, :null: false
- has_many favorite_id, :refrence, :null: false


## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|
### Association
- belongs_to :product

## Brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|
### Association
- belongs_to :product

## Product_image
|Column|Type|Options|
|------|----|-------|
|product_id|string|null: false|
|image|string|


## Buying_listテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## Selling_listテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## Favoriteテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## Buying_commentテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|coment|string|
### Association
- belongs_to :user
- belongs_to :product



## Paymentテーブル
|Column|Type|Options|
|------|----|-------|
|card_num|references|null: false, foreign_key: true|
|use_year|references|null: false, foreign_key: true|
|use_month|references|null: false, foreign_key: true|
|security_code|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :products
