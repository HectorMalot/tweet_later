task :environment do
  ENV["RACK_ENV"] ||= "development"
  require File.join(File.dirname(__FILE__), 'tweet_later.rb')
end

namespace :db do
  
  desc "Migrate the DB"
  task :migrate => :environment do
    DataMapper.auto_upgrade!
  end
  
  desc "Reset the DB"
  task :reset => :environment do
    DataMapper.auto_migrate!
  end
  
end