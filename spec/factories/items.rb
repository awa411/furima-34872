FactoryBot.define do
  factory :item do
    item_name                { Faker::Name.initials(number: 2) }
    description              { Faker::Lorem.sentence }
    category_id              { rand(2..11) }
    status_id                { rand(2..7) }
    shipping_charge_id       { rand(2..3) }
    state_id                 { rand(2..48) }
    day_to_ship_id           { rand(2..4) }
    price                    { rand(300..9_999_999) }
    association              :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/cherry-blossom-6068004_1920.jpg'), filename: 'test_image.jpg')
    end
  end
end
