class Bookmark < ApplicationRecord
  validates :title, :url, presence: true
  validates :url, http_url: true

  belongs_to :site

  before_validation :set_site
  after_destroy :destroy_empty_site

  def self.search(search)
    if search
      where('url LIKE :search OR title LIKE :search OR shortening LIKE :search',
        {search: "%#{search}%"})
    else
      scoped
    end
  end

  private

    def set_site
      host = URI.parse(self.url).host
      self.site = Site.find_or_create_by(url: host)
    end

    def destroy_empty_site
      self.site.destroy if self.site.bookmarks.empty?
    end
end