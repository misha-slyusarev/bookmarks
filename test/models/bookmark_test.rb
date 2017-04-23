require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  test "don't save bookmark with incorrect url" do
    bookmark = Bookmark.new(title: 'title', url: 'incorrect url')
    assert_not bookmark.save
  end

  test "don't save bookmark without title" do
    bookmark = Bookmark.new(url: 'http://correct.url')
    assert_not bookmark.save
  end
end
