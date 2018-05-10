require 'bookmark'
require 'pg'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do

      add_three_bookmarks

      expected_bookmarks = [
         {:title=>"Makers", :url=>"http://makersacademy.com"},
         {:title=>"Google", :url=>"http://google.com"},
         {:title=>"Destroy", :url=>"http://destroyallsoftware.com"}
      ]
      expect(Bookmark.all).to eq(expected_bookmarks)
    end
  end

  describe '.create' do
    it 'adds a url to the database' do
      Bookmark.create('Yahoo', "http://yahoo.com")
      expect(Bookmark.all).to include({:title=>"Yahoo", :url=>"http://yahoo.com"})
    end

  end

end
