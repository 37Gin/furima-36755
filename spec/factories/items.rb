FactoryBot.define do
  factory :item do
    
    title            { Faker::Name.last_name }
    explanation      { Faker::Lorem.sentence }
    category_id      { 2 }
    state_id         { 2 }
    delivery_fee_id  { 2 }
    region_id        { 2 }
    shipping_date_id { 2 }
    price            { 9999 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end

  end
end
