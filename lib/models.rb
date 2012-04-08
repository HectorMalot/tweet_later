require 'rubygems'
require 'data_mapper'

# A Sqlite3 connection:
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db/development.db")

class User
  include DataMapper::Resource
  property :id,       Serial    # An auto-increment integer key
  property :name,     String    # A varchar type string, for short strings
end

DataMapper.finalize
DataMapper.auto_upgrade!