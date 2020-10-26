FactoryBot.define do
  factory :user_buy do
    postal_code    { '123-4567' }
    prefecture_id  { 3 }
    municipality   { '横浜市緑区' }
    addres         { '青山1-1' }
    building_name  { '柳ビル103' }
    tell           { 99012345678 }
  end
end
