ENV['RACK_ENV'] = 'test'

require './app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = BookmarkManager
