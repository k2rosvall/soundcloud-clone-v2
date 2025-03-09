FactoryBot.define do
  factory :profile do
    user
    name { Faker::Name.name }
    username { Faker::Internet.username }
    bio { "This is my bio"  }
  end
end
