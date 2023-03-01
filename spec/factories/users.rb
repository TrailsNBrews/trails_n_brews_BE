FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    google_id { Faker::Number.number(digits: 10)}
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name }
    google_token { Faker::Number.number(digits: 7) }
  end
end
