FactoryBot.define do
  factory :log do
    association :user
    association :item
  end
end
