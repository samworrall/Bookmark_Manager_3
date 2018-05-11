require 'pg'

class Bookmark
  attr_reader :title, :url

  def initialize(title, url)
    @title = title
    @url = url
  end

  def ==(bookmark)
    @url == bookmark.url
  end

  def self.all
    result = choose_database.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| Bookmark.new(bookmark['title'], bookmark['url']) }
  end

  def self.create(title, url)
    if  url =~ URI::regexp
      result = choose_database.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING url, title;")
      Bookmark.new(result.first['title'], result.first['url'])
    end
  end

  def self.delete(title)
    if self.all.any? { |bookmark| bookmark.title == title }
      choose_database.exec("DELETE FROM bookmarks WHERE title = '#{title}';")
    end
  end

  def self.update(current_title, new_title)
    if self.all.any? { |bookmark| bookmark.title == current_title }
      choose_database.exec("UPDATE bookmarks SET title = '#{new_title}' WHERE title = '#{current_title}'")
    end
  end

  private

  def self.choose_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end

end
