require File.dirname(__FILE__) + '/spec_helper'

describe 'MyApp' do
  include Rack::Test::Methods

  def app
    TweetLater
  end

  it 'should run a simple test' do
    get '/'
    last_response.status.should == 200
  end
end