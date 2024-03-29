#!/usr/bin/env ruby
require 'sinatra/base'
require './lib/models'
require './lib/helpers'
require 'haml'
require 'rack-flash'
require 'omniauth-twitter'
require 'twitter'
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
  Twitter.configure do |config|
    config.consumer_key = APP_CONFIG[:twitter_api_key]
    config.consumer_secret = APP_CONFIG[:twitter_api_secret]
  end

  helpers DefaultHelper, SessionHelper

  #############################################
  ## The default HOMEPAGE
  #############################################
  get '/' do
    flash[:notice] = "hello"
    flash[:error]  = "world"
    haml :root
  end
  
  #############################################
  ## Everything with AUTHENTICATION
  #############################################
  get '/sign_in' do
    redirect to('/auth/twitter')
  end
  
  get '/auth/twitter/callback' do
    if @user = User.find_or_create_from_omniauth(request.env['omniauth.auth'])
      sign_in @user
      flash[:success] = "Welcome #{@user}!"
      redirect to('/dashboard')
    else
      flash[:error] = "Something went wrong with your twitter authentication"
      redirect to('/')
    end
  end
  
  get '/auth/failure' do
    flash[:error] = "Error: Your login was rejected"
    haml :'omniauth/failure'
  end
  
  get '/auth/twitter/deauthorized' do
    haml "Twitter has deauthorized this app."
  end
  
  get '/sign_out' do
    sign_out
    redirect to('/')
  end

  #############################################
  ## The main DASHBOARD
  #############################################
  get '/dashboard' do
    haml :dashboard
  end
  
  post '/tweets' do
    #@client = Twitter::Client.new(
    #  :oauth_token => "a user's OAuth token",
    #  :oauth_token_secret => "a user's OAuth secret"
    #)
    #@client.update("Tweeting as the authenticated user!")
    "blaaa"
  end
end