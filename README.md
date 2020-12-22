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
has_many :product
has_many :purchase
has_one :street


## products table

| Column                                 | Type       | Options                        |
|----------------------------------------|------------|--------------------------------|
| product_name                           | string     | null: false                    |
| product_description                    | text       | null: false                    |
| category_id                            | integer    | null: false                    |
| product_condition_id                   | integer  　| null: false                    |
| shipping_charges_id                    | integer    | null: false                    |
| delivery_area_id                       | integer    | null: false                    |
| days_to_ship_id                        | integer    | null: false                    |
| price                                  | integer    | null: false                    |
| user_id                                | references | foreign_key: true              |

### Association
belongs_to :user
has_one :purchase



## streets table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| postal_code     | string     | null: false       |
| prefectures_id  | integer    | null: false       |
| municipality    | string     | null: false       |
| address         | string     | null: false       |
| phone_number    | integer    | null: false       |
| building        | string     |                   |

### Association
belongs_to :purchase

## purchases table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| users           | references | null: false       |
| products        | references | null: false       |

### Association
belongs_to :user
belongs_to :product
has_one :street