class Tag < ApplicationRecord
  has_and_belongs_to_many :bookmarks

  validates :name, presence: true

  before_save :normalize_name

  private

    def normalize_name
      self[:name] = name.downcase
    end
end
