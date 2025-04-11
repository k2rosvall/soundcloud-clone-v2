FactoryBot.define do
  factory :track do
    profile
    name { Faker::Music::RockBand.song }
    description { "This is my description"  }

    after(:build) do |track|
      track.file.attach(
        io: File.open("test/fixtures/files/sample-track.mp3"),
        filename: "sample-track.mp3",
        content_type: "audio/mpeg"
       )
    end
  end
end
