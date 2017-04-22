class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|

      t.string :title
      t.index :title

      t.string :url
      t.index :url

      t.string :shortening

      t.timestamps
    end
  end
end
