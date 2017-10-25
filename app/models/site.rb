class Site < ApplicationRecord
  has_many :bookmarks, dependent: :destroy

  validates :url, presence: true
  validates :url, http_url: true
end
