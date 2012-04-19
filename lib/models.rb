require 'data_mapper'
require 'digest'

# setup Sqlite3 connection:
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db/development.db")
DataMapper.setup(:default, "sqlite::memory:") if ENV['RACK_ENV'] = 'test'

class User
  include DataMapper::Resource
  property :id,       Serial    # An auto-increment integer key
  property :name,     String    # A real name
  property :username, String    # The users Twitter handle
  property :uid,      String, :unique_index => true    # Twitters UUID
  property :token,    String, 
    :length => 32, 
    :default => lambda { |r, p| Digest::MD5.hexdigest(Random.rand(2**256)) } # A string used as an auth token
  property :info,     Object      # A dump of the users OAuth callback
  has n,   :twitter_accounts    # A user can have many twitter accounts
  
  def self.find_or_create_from_omniauth(auth_hash)
    if user = self.get(:uid => auth_hash['uid'])
      # User exists!
      # Lets update the username and info hash and be done with it
    else
      # User is registering
      user = User.create(
        :uid      => auth_hash["uid"],
        :name     => auth_hash["info"]["name"],
        :username => auth_hash["info"]["nickname"],
        :info     => auth_hash
      )
      user.twitter_accounts.create(
        :uid          => auth_hash["uid"],
        :name         => auth_hash["info"]["name"],
        :username     => auth_hash["info"]["nickname"],
        :oauth_token  => auth_hash["credentials"]["token"],
        :oauth_secret => auth_hash["credentials"]["secret"],
        :info         => auth_hash
      )
    end
    user
  end
end




class TwitterAccount
  include DataMapper::Resource
  property :id,       Serial    # An auto-increment integer key
  property :uid,      String    # UUID from twitter
  property :name,     String    # A real name
  property :username, String    # The users Twitter handle
  property :oauth_token,  String # Oauth Token
  property :oauth_secret, String # Oauth Secret
  property :info,     Object      # A dump of the users OAuth callback
  belongs_to :user
end

DataMapper.finalize
DataMapper.auto_upgrade!

# TODO: remove this
#[2] pry(#<TweetLater>)> request.env['omniauth.auth']
#=> {
# "provider"=>"twitter",
# "uid"=>"495033320",
# "info"=>
#  {"nickname"=>"HectorMalot",
#   "name"=>"Hector Malot",
#   "location"=>nil,
#   "image"=>
#    "http://a0.twimg.com/sticky/default_profile_images/default_profile_5_normal.png",
#   "description"=>nil,
#   "urls"=>{"Website"=>nil, "Twitter"=>"http://twitter.com/HectorMalot"}},
# "credentials"=>
#  {"token"=>"495033320-Sto7cvaNjGk5TKcDPbQ6oglFDvSVIlCttXn2wuUY",
#   "secret"=>"qtwegRY42AYMpkxMhyNZxsAav2b7j4h6ukHKk2OJJk"},
