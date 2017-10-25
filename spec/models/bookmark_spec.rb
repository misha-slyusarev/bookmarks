require 'rails_helper'

RSpec.describe Bookmark, :type => :model do
  subject(:bookmark) { create(:bookmark) }

  it { is_expected.to be_valid }

  context 'when url is new to the system' do
    it 'creates a new Site' do
      expect{ bookmark }.to change{ Site.count }.by(1)
    end
  end

  context 'when url is already known to the system' do
    let(:known_url) { 'http://known.url' }
    let(:duplicate) { create(:bookmark, url: known_url) }
    let!(:site) { create(:bookmark, url: known_url).site }

    it "doesn't create new Site" do
      expect{ duplicate }.to change{ Site.count }.by(0)
    end
    it 'attaches new bookmark to existing Site' do
      expect( duplicate.site.url ).to eq(site.url)
    end
  end

  it 'is not valid without a title' do
    bookmark.title = nil
    expect(bookmark).not_to be_valid
  end

  it 'is not valid without a url' do
    bookmark.url = nil
    expect(bookmark).not_to be_valid
  end
end
