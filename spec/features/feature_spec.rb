require_relative '../../app.rb'
require 'spec_helper'
require 'pg'


feature BookmarkManager do

  feature 'Viewing bookmarks' do
    scenario 'A user can see bookmarks' do

      add_three_bookmarks

      visit '/bookmarks'
      expect(page).to have_content("Google")
      expect(page).to have_content("Destroy")
      expect(page).to have_content("Makers")
    end
  end

  feature 'Adding bookmarks' do
    scenario 'User should receive confirmation' do
      visit'/'
      fill_in 'Name', with: 'Yahoo'
      fill_in 'Url', with: 'http://yahoo.com'
      click_button 'Submit'
      expect(page).to have_content "Yahoo"
    end

    scenario 'Should take you to error page' do
      visit'/'
      fill_in 'Name', with: '12345'
      fill_in 'Url', with: '12345'
      click_button 'Submit'
      expect(page).to have_content('INVALID URL')
    end

  end

end
