require_relative '../../app.rb'
require 'spec_helper'
require 'pg'


feature BookmarkManager do

  feature 'Testing infrastructure' do
      scenario 'should return string' do
        visit '/'
        expect(page).to have_content("Testing infrastructure working!")
    end
  end

  feature 'Viewing bookmarks' do
    scenario 'A user can see bookmarks' do

      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES('http://makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://destroyallsoftware.com');")

      visit '/bookmarks'
      expect(page).to have_content("http://google.com")
      expect(page).to have_content("http://destroyallsoftware.com")
      expect(page).to have_content("http://makersacademy.com")
    end
  end

end
