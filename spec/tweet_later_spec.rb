require File.dirname(__FILE__) + '/spec_helper'

describe TweetLater do
  include Rack::Test::Methods

  def app
    TweetLater
  end

  it 'should have a homepage' do
    get '/'
    last_response.status.should == 200
  end
end