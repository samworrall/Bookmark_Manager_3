ENV['ENVIRONMENT'] = 'test'

require './app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative './features/web_helper'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:each) do
    require_relative './setup_test_database.rb'
  end
end
