FactoryBot.define do
  factory :item do
    product_name              {Faker::Lorem.sentence}
    product_description       {Faker::Lorem.sentence}
    category_id               { 2 }
    condition_id              { 2 }
    shipping_charge_id        { 2 }
    shipping_area_id          { 2 }
    days_to_ship_id           { 2 }
    price                     { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end