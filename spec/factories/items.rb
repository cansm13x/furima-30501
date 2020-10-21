FactoryBot.define do
  factory :item do
    name          { '写真' }
    description   { '富士山の写真' }
    category_id   { 2 }
    status_id     { 2 }
    delivery_id   { 2 }
    area_id       { 2 }
    day_id        { 2 }
    price         { 1000 }
    association   :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
