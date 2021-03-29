FactoryBot.define do
  factory :items_tag do
    item_name                { Faker::Name.initials(number: 2) }
    description              { Faker::Lorem.sentence }
    category_id              { rand(2..11) }
    status_id                { rand(2..7) }
    shipping_charge_id       { rand(2..3) }
    state_id                 { rand(2..48) }
    day_to_ship_id           { rand(2..4) }
    price                    { rand(300..9_999_999) }
    images  {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/cherry-blossom-6068004_1920.jpg'))}
    name                     {Faker::Name.initials(number: 2) }
    
  #   after(:build) do |items_tag|
  #     items_tag.images.attach(io: File.open('public/images/cherry-blossom-6068004_1920.jpg'), filename: 'test_image.jpg')
  #   end
   end
end