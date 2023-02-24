FactoryBot.define do
  factory :brewery do
    brew_id { Faker::String.random(length: 7) }
  end
end
