ENV['RACK_ENV'] = 'test'

$:.unshift File.join(File.dirname(__FILE__),'..','..')
require 'tweet_later.rb'
require 'factory_girl'# Use factory_girl for factories
require 'capybara'
require 'capybara/cucumber'
require 'rspec'

# load all factories from RSpec
Dir["spec/factories/*.rb"].each do |file| 
  require file
end

Capybara.app = TweetLater

class TweetLaterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  TweetLaterWorld.new
end