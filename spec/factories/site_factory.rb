FactoryGirl.define do
  factory :site do
    url Faker::Internet.url
  end
end
