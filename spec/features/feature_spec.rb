require_relative '../../app.rb'
require 'spec_helper'
require 'pg'


feature BookmarkManager do

  feature 'Viewing bookmarks' do
    scenario 'A user can see bookmarks' do

      add_three_bookmarks

      visit '/bookmarks'
      expect(page).to have_content("http://google.com")
      expect(page).to have_content("http://destroyallsoftware.com")
      expect(page).to have_content("http://makersacademy.com")
    end
  end

  feature 'Adding bookmarks' do
    scenario 'User should receive confirmation' do
      visit'/'
      fill_in 'Name', with: 'Yahoo'
      fill_in 'Url', with: 'http://yahoo.com'
      click_button 'Submit'
      expect(page).to have_content "http://yahoo.com"
    end
  end

end
