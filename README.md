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
|phone_num|string|null: false|
|authentication_code|string|null: false|
|plofiletext|string|null: false|
|zip_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building_name|string|
### Association
- has_many :products, through: :products_users
- has_one :users, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_many :byuing_list, dependent: :destroy
- has_many :selling_list, dependent: :destroy
- has_many :reference, dependent: :destroy
- has_many :fovorite, dependent: :destroy

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
- belongs_to :product
- has_many :users, through: :products_users
- has_many :buying_coment_id, :refrence, :null: false
- has_many :product_image_id, :refrence, :null: false
- has_many favorite_id, :refrence, :null: false

## Products_Usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product


## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to :product
- has_many :brands, through: :category_brand

## Brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to :product
- has_many :category, through: :category_brand

## Category_Brandテーブル
|Column|Type|Options|
|------|----|-------|
|catergory_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
### Association
- belongs_to :product

## Product_image
|Column|Type|Options|
|------|----|-------|
|product_id|reference|null: false, foreign_key: true|
|image|string|
### Association
- belongs_to :product


## Paymentテーブル
|Column|Type|Options|
|------|----|-------|
|card_num|integer|null: false, foreign_key: true|
|use_year|integer|null: false, foreign_key: true|
|use_month|integer|null: false, foreign_key: true|
|security_code|integer|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|
### Association
- has_many :product


<!-- 
## Adressテーブル
|Column|Type|Options|
|------|----|-------|
|plofiletext|string|null: false|
|zip_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building_name|string|
### Association
- belongs_to :users -->

<!-- 
## Profileテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|nickname|string|null: false|
|coment|string|
### Association
- belongs_to :users -->


<!-- ## Favoriteテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product -->

<!-- ## Selling_listテーブル
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