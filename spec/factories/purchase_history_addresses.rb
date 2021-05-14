FactoryBot.define do
  factory :purchase_history_address do
    postal_code            { '123-4567' }
    prefecture_id          { 2 }
    municipality           { '宇都宮市' }
    house_number           { '西原１−５' }
    building_name          { 'サーパス２０９' }
    phone_number           { '09012345678'}
    association :user
    association :item
  end
end
