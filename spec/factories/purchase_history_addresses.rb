FactoryBot.define do
  factory :purchase_history_address do
    token                  { 'tok_abcdefghijk00000000000000000'}
    postal_code            { '123-4567' }
    prefecture_id          { 2 }
    municipality           { '那覇市'}
    house_number           { '金録1-3'}
    building_name          { 'マンション木村'}
    phone_number           { '09012345678'}
    association :user
    association :item
  end
end
