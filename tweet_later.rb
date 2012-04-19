#!/usr/bin/env ruby
require 'sinatra/base'
require './lib/models'
require './lib/helpers'
require 'haml'
require 'rack-flash'
require 'omniauth-twitter'
require './config/initializer'

if ENV['RACK_ENV'] == "development"
  require 'pry' 
end

class TweetLater < Sinatra::Application
  # Initial setup of the app
  enable :sessions
  use Rack::Flash
  use OmniAuth::Builder do
      provider :twitter, APP_CONFIG[:twitter_api_key],APP_CONFIG[:twitter_api_secret]
  end

  helpers DefaultHelper, SessionHelper

  get '/' do
    haml :root
  end
  
  get '/sign_in' do
    redirect to('/auth/twitter')
  end
  
  get '/auth/twitter/callback' do
    # Pseudo code
    # Check if a user with the uuid exists
    # session[:user_token] = "true"
    haml %(Got successfull authentication!)
  end
  
  get '/auth/failure' do
    haml "Oh no, twitter auth failed!"
  end
  
  get '/auth/twitter/deauthorized' do
    haml "Twitter has deauthorized this app."
  end
end