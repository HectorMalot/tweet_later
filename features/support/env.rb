ENV['RACK_ENV'] = 'test'

$:.unshift File.join(File.dirname(__FILE__),'..','..')
require 'tweet_later.rb'
require 'factory_girl'# Use factory_girl for factories
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'database_cleaner'

# Setup database cleaning
DatabaseCleaner.strategy = :truncation
  
# load all factories from RSpec
Dir["spec/factories/*.rb"].each do |file| 
  require file
end

Capybara.app = TweetLater

class TweetLaterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
  RSpec::Mocks::setup(Object.new)
  
end

World do
  TweetLaterWorld.new
end