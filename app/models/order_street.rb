class OrderStreet

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :municipality, :address, :phone_number, :building, :order_id, :hoge

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } #郵便番号
    validates :delivery_area_id,    numericality: { other_than: 0} #都道府県
    validates :municipality     #市区町村
    validates :address          #番地
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }   #電話番号
  end

  def save
    orderstreet = Order.create(user_id: user_id, item_id: item_id)
    Street.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipality: municipality, address: address, phone_number: phone_number, building: building, order_id: orderstreet.id)
  end 

end