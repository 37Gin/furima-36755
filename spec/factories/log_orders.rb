FactoryBot.define do
  factory :log_order do
    postcode      { '000-0000' }
    region_id     { 2 }
    city          { 'A市B町C村' }
    address       { '1丁目2番3号' }
    building_name { 'Sampleビル101号室' }
    phone_number  { 1234567890 }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
