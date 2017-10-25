require 'rails_helper'

RSpec.describe Site, type: :model do
  let!(:bookmark) { create(:bookmark) }

  subject(:site) { bookmark.site }

  it { is_expected.to be_valid }
end
