require 'rails_helper'

RSpec.describe Site, type: :model do
  let!(:bookmark) { create(:bookmark) }

  subject(:site) { bookmark.site }

  it { is_expected.to be_valid }

  context 'when last bookmark removed' do
    before { bookmark.destroy }

    it 'destroys itself' do
      expect{ site.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
