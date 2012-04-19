require File.join(File.dirname(__FILE__), '..', 'tweet_later.rb')

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'rspec'

set :environment, :test

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  #config.run_all_when_everything_filtered = true
  #config.filter_run :focus
  config.before(:each) { DataMapper.auto_migrate! }
end