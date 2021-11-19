FactoryBot.define do
  factory :items_tag do
    item_name { Faker::Name.name }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipment_fee_id { Faker::Number.between(from: 2, to: 3) }
    shipment_days_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    tag_name { Faker::Name.name }
    # images { 'image.png' }
  end
end
