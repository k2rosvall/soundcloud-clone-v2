FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }

    trait :with_profile do
      after(:create) do |user|
        profile = create(:profile, user: user)
        user.update(profile: profile)
      end
    end
  end
end
