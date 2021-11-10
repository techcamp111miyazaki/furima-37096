FactoryBot.define do
  factory :order_shipment do
    postal_code { "123-4567" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Address.community }
    telephone_number { "090-1234-5678" }
    token { "tok_abcdefghijk00000000000000000" }

  end
end
