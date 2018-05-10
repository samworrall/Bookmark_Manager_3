require 'bookmark'
require 'pg'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      add_three_bookmarks
      expect(Bookmark.all).to all(be_instance_of(Bookmark))
    end
  end

  describe '.create' do
    it 'adds a url to the database' do
      Bookmark.create('Yahoo', "http://yahoo.com")
      expect(Bookmark.all[0].title).to eq('Yahoo')
    end

  end

end
