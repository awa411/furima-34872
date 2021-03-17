FactoryBot.define do
  factory :order_address do
    postal_code  {'123-4567'}
    state_id     { 2 }
    city         { 'あ区'}
    town         { 'あ町'}
    building     { 'あ棟'}
    phone_number { '00000000000' }
    token        {"tok_abcdefghijk00000000000000000"}
    association :item
    association :user
  end
end