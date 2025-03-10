FactoryBot.define do
  factory :track do
    profile
    name { Faker::Music::RockBand.song }
    description { "This is my description"  }
  end
end
