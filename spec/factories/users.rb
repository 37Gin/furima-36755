FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname { Faker::Name.last_name }
    last_name_kanji { '山田' }
    first_name_kanji { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.in_date_period(year: 2000, month: 1) }
  end
end
