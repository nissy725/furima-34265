FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.free_email}
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    last_name_kanji       {'西藤'}
    first_name_kanji      {'尚信'}
    last_name_kana        {'ニシフジ'}
    first_name_kana       {'タカノブ'}
    birthday              {'1983-07-25'}
  end
end