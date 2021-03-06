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
has_many :items
has_many :order


## items table

| Column                                 | Type       | Options                        |
|----------------------------------------|------------|--------------------------------|
| item_name                              | string     | null: false                    |
| item_description                       | text       | null: false                    |
| category_id                            | integer    | null: false                    |
| item_condition_id                      | integer    | null: false                    |
| shipping_charge_id                     | integer    | null: false                    |
| delivery_area_id                       | integer    | null: false                    |
| days_to_ship_id                        | integer    | null: false                    |
| price                                  | integer    | null: false                    |
| user                                   | references | foreign_key: true              |

### Association
belongs_to :user
has_one :order


## streets table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| postal_code        | string     | null: false       |
| delivery_area_id   | integer    | null: false       |
| municipality       | string     | null: false       |
| address            | string     | null: false       |
| phone_number       | string     | null: false       |
| building           | string     |                   |
| order              | references | foreign_key: true |
### Association
belongs_to :order

## orders table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| user            | references | null: false       |
| item            | references | null: false       |

### Association
belongs_to :user
belongs_to :item
has_one :street