require 'bookmark'
require 'pg'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do

      add_three_bookmarks

      expected_bookmarks = [
        "http://makersacademy.com",
        "http://google.com",
        "http://destroyallsoftware.com"
      ]

      expect(Bookmark.all).to eq(expected_bookmarks)
    end
  end

  describe '.create' do
    it 'adds a url to the database' do

    Bookmark.create("http://yahoo.com")
    expect(Bookmark.all).to include("http://yahoo.com")
    end
  end

end
