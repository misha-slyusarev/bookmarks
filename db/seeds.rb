require 'faker'
require 'factory_girl_rails'

10.times do
  Bookmark.create(
    title: Faker::Company.name,
    url: Faker::Internet.url,
    shortening: Faker::TwinPeaks.quote,
    tag_list: Faker::Coffee.notes.delete(',')
  )
end
