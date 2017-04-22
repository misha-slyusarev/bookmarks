class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|

      t.string :title, index: true
      t.string :url, index: true
      t.string :shortening

      t.timestamps
    end
  end
end
