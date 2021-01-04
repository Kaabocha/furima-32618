FactoryBot.define do

  factory :item do
    item_name { '範馬刃牙' }
    item_description { '最強の息子です。' }
    category_id { '2' }
    item_condition_id { '2' }
    shipping_charge_id { '2' }
    delivery_area_id { '2' }
    days_to_ship_id { '2' }
    price { '1000' }
    user
      after(:build) do |item|
      # ActiveStorageの場合
      item.image.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
  end
end
