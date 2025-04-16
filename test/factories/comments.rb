FactoryBot.define do
  factory :comment do
    profile
    track
    content { "Awesome track!" }
  end
end
