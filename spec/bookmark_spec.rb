require 'bookmark'
require 'pg'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create('Yahoo', "http://yahoo.com")
      expect(Bookmark.all).to all(be_instance_of(Bookmark))
    end
  end

  describe '.create' do
    it 'adds a url to the database' do
      Bookmark.create('Yahoo', "http://yahoo.com")
      expect(Bookmark.all[0].title).to eq('Yahoo')
    end
  end

  describe '.delete' do
    it 'deletes a url from the database' do
      Bookmark.create('Yahoo', "http://yahoo.com")
      Bookmark.delete('Yahoo')
      expect(Bookmark.all).to be_empty
    end
  end

end
