FactoryBot.define do
  factory :order_street do
    postal_code                      { "123-4567" }
    delivery_area_id                 { 2 }
    municipality                     { "横浜市美浜区" }
    address                          { "青山1-1-1" }
    building                         { "" }
    phone_number                     { "09012345678" }
    token                            { "testtest" }
    user_id                          { 1 }
    item_id                          { 1 }
  end
end
