class Site < ApplicationRecord
  has_many :bookmarks, dependent: :destroy

  after_touch :destroy, if: -> { bookmarks.empty? }
end
