FactoryBot.define do
  factory :order_street do
    postal_code                      { "123-4567" }
    delivery_area_id                 { 1 }
    municipality                     { "横浜市美浜区" }
    address                          { "柳ビル101" }
    phone_number                     { "09012345678" }
    token                            { "testtest" }
  end
end
