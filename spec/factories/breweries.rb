FactoryBot.define do
  factory :brewery do
    brew_id { Faker::Number.between(from: 10, to: 100000) }
  end
end
