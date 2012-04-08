Given /^I am signed in$/ do
  @current_user = FactoryGirl.create :user
end

class User
  include DataMapper::Resource
  property :id,       Serial    # An auto-increment integer key
  property :name,     String    # A varchar type string, for short strings
end