class Bookmark < ApplicationRecord
  belongs_to :site, inverse_of: :bookmarks
  has_and_belongs_to_many :tags, inverse_of: :bookmarks

  before_validation :prepare_url
  around_destroy :destroy_empty_site

  validates :title, :url, :site, presence: true
  validates :url, http_url: true

  scope :includes_text, -> (text) do
    return all if text.blank?

    joins(:tags).where('tags.name LIKE :text
      OR url LIKE :text
      OR title LIKE :text
      OR shortening LIKE :text',
      { text: "%#{text}%" }).distinct
  end

  def tag_list
    tags.map(&:name).join(' ')
  end

  def tag_list=(list)
    self.tags = list.split(' ').uniq.map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end
  end

  private

    def prepare_url
      check_scheme
      parse_url
      set_site
    end

    def check_scheme
      self.url = "http://#{url}" unless url && url[/\A.*:\/\//]
    end

    def parse_url
      @uri = URI.parse(url)
    rescue URI::Error => e
      logger.error("Couldn't parse URL: #{url}")
      logger.error(e)
    end

    def set_site
      self.site = Site.find_or_create_by(url: "#{@uri.scheme}://#{@uri.host}")
    end

    def destroy_empty_site
      current_site = self.site
      yield
      current_site.destroy if current_site.bookmarks.size == 0
    end
end
