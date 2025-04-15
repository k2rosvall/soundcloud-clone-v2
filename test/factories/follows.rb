FactoryBot.define do
  factory :follow do
    association :follower, factory: :profile
    association :followed, factory: :profile
  end
end
