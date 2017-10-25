FactoryGirl.define do
  factory :bookmark do
    title Faker::Name.title
    url Faker::Internet.url
    shortening Faker::TwinPeaks.quote
  end
end
