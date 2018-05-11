require 'bookmark'
require 'pg'

describe Bookmark, :bookmark do

  describe '#all', :all do
    it 'returns all bookmarks' do
      Bookmark.create('Yahoo', "http://yahoo.com")
      expect(Bookmark.all).to all(be_instance_of(Bookmark))
    end
  end

  describe '#create', :create do

    it 'returns a bookmark instance' do
      bookmark = Bookmark.create('Yahoo', 'http://yahoo.com')
      expect(Bookmark.all).to include(bookmark)
    end

    it 'Adds a url to the database' do
      Bookmark.create('Yahoo', 'http://yahoo.com')
      expect(Bookmark.all[0].title).to eq('Yahoo')
    end
  end

  describe '#delete', :delete do
    it 'Deletes a url from the database' do
      Bookmark.create('Yahoo', 'http://yahoo.com')
      Bookmark.delete('Yahoo')
      expect(Bookmark.all).to be_empty
    end
  end

  describe '#update', :update do
    it 'Updates the title of a bookmark' do
      Bookmark.create('Yahoo', 'http://yahoo.com')
      Bookmark.update('Yahoo', 'Yahaa')
      expect(Bookmark.all[0].title).to eq('Yahaa')
    end
  end

  describe '#title' do
    it 'Returns the title of the bookmark' do
      Bookmark.create('Yahoo', 'http://yahoo.com')
      expect(Bookmark.all[0].title).to eq 'Yahoo'
    end
  end

  describe '#url' do
    it 'Returns the title of the bookmark' do
      Bookmark.create('Yahoo', 'http://yahoo.com')
      expect(Bookmark.all[0].url).to eq 'http://yahoo.com'
    end
  end

end
