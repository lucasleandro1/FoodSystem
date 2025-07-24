FactoryBot.define do
  factory :order do
    user_id { 1 }
    pickup_address { "Rua A" }
    delivery_address { "Rua B" }
    items_description { "Item 1, Item 2" }
    estimated_value { 50.0 }
    requested_at { Time.current }
  end
end
