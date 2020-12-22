# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | unique: true            |
| password           | string              | null: false             |
| family_name        | string              | null: false             |
| first_name         | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |
| nick_name          | string              | null: false             |

### Association
has_many :product
has_many :purchase
has_one :street


## products table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product_name                        | string     | null: false       |
| image                               | text       | null: false       |
| product_description                 | text       | null: false       |
| category                            | references | null: false       |
| product_condition                   | text     　| null: false       |
| shipping_charges                    | string     | null: false       |
| delivery_area                       | string     | null: false       |
| days_to_ship                        | string     | null: false       |
| price                               | integer    | null: false       |
| user_id                             | references | foreign_key: true |

### Association
belongs_to :user
has_one :purchase



## streets table

| Column       | Type       | Options           |
|--------------|------------|-------------------|
| postal_code  | integer    | null: false       |
| prefectures  | string     | null: false       |
| municipality | string     | null: false       |
| address      | string     | null: false       |
| phone_number | integer    | null: false       |

### Association
belongs_to :user

## purchases table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| buyer_id        | text       | null: false       |
| Purchased_item  | references | null: false       |

### Association
belongs_to :user
belongs_to :product