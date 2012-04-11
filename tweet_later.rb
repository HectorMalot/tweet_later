#!/usr/bin/env ruby
require 'sinatra/base'
require 'haml'
require 'lib/models.rb'
require 'rack-flash'

class TweetLater < Sinatra::Application
  enable :sessions
  use Rack::Flash
  
  get '/' do
    "Hello World"
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end