FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname                { Faker::Name.name }
    email                   { Faker::Internet.free_email }
    password                { '12345k' }
    password_confirmation   { '12345k' }
    last_name               { person.last.kanji }
    first_name              { person.first.kanji }
    last_name_kana          { person.last.katakana }
    first_name_kana         { person.first.katakana }
    birth_date              { Faker::Date.backward }
  end
end
