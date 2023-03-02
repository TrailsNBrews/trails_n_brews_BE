FactoryBot.define do
  factory :trail do
    name {Faker::FunnyName.name}
    trail_id { Faker::Number.between(from: 10, to: 100000) }
  end
end