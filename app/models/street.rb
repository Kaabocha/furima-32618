class Street < ApplicationRecord

  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number

end