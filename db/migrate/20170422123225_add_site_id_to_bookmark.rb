class AddSiteIdToBookmark < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookmarks, :site, index: true, foreign_key: true
  end
end
