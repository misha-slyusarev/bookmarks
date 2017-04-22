class Bookmark < ApplicationRecord
  validates :title, :url, presence: true
  validates :url, http_url: true
end
