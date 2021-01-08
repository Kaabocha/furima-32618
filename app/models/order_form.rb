class OrderForm

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :municipality, :address, :phone_number, :building, :order_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } #郵便番号
    validates :delivery_area_id,    numericality: { other_than: 0, message: "can't be blank" } #都道府県
    validates :municipality     #市区町村
    validates :address          #番地
    validates :phone_number, format: { with: /\A[0-11]\z/, message: "can't be blank" }     #電話番号
  end

  def save
    Order.create(user_id: user, item_id: item)
    Street.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipality: municipality, address: address, phone_number: phone_number, building: building, order_id: order)
  end 

end