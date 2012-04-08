#!/usr/bin/env ruby
require 'sinatra/base'
require 'haml'
require 'lib/models.rb'

class TweetLater < Sinatra::Application
  get '/' do
    "Hello World"
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end