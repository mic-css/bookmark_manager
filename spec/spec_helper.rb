ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '/app/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = BookmarkManager
