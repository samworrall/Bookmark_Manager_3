require 'pg'

class Bookmark

  def self.all
    result = choose_database.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| { title: bookmark['title'], url: bookmark['url'] } }
  end

  def self.create(title, url)
    if  url =~ URI::regexp
      choose_database.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
    else
      false
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
