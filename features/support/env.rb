$:.unshift File.join(File.dirname(__FILE__),'../..')

# Use ThoughtBots factory_girl for model factories
require 'factory_girl'

# load all factories from RSpec
Dir["spec/factories/*.rb"].each do |file| 
  require file
end


# Stuf that'll later move to the application
require 'rubygems'
require 'data_mapper'

# A Sqlite3 connection:
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db/development.db")

AfterConfiguration do |config|
  DataMapper.finalize
  DataMapper.auto_upgrade!
end