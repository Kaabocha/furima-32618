class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :delivery_area
  belongs_to :item_condition
  belongs_to :shipping_charge
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :item_description
    validates :category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :delivery_area_id
    validates :days_to_ship_id
    validates :price, format: { with: /\A[0-9]+\z/ } # 価格は半角数字のみ (全角やアルファベットでは登録できない)
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999 } # 価格の範囲は300円〜9,999,999円まで
    validates :item_description, length: { maximum: 1000 } # 商品の説明は１０００文字まで
    validates :item_name, length: { maximum: 40 } # 商品名は４０文字まで
    validates :image
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
end
