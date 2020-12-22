# DB 設計

## users table

| Column             | Type                | Options                              |
|--------------------|---------------------|--------------------------------------|
| email              | string              | null: false, unique: true            |
| encrypted_password | string              | null: false                          |
| family_name        | string              | null: false                          |
| first_name         | string              | null: false                          |
| family_name_kana   | string              | null: false                          |
| first_name_kana    | string              | null: false                          |
| birthday           | date                | null: false                          |
| nick_name          | string              | null: false                          |

### Association
has_many :products
has_many :purchases


## products table

| Column                                 | Type       | Options                        |
|----------------------------------------|------------|--------------------------------|
| product_name                           | string     | null: false                    |
| product_description                    | text       | null: false                    |
| category_id                            | integer    | null: false                    |
| product_condition_id                   | integer    | null: false                    |
| shipping_charge_id                     | integer    | null: false                    |
| delivery_area_id                       | integer    | null: false                    |
| days_to_ship_id                        | integer    | null: false                    |
| price                                  | integer    | null: false                    |
| user                                   | references | foreign_key: true              |

### Association
belongs_to :user


## streets table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| postal_code     | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| municipality    | string     | null: false       |
| address         | string     | null: false       |
| phone_number    | integer    | null: false       |
| building        | string     |                   |
| purchase        | references | foreign_key: true |
### Association
belongs_to :purchase

## purchases table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| user            | references | null: false       |
| product         | references | null: false       |

### Association
belongs_to :user
belongs_to :product
has_one :street