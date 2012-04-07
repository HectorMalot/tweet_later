source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jquery-rails'

# Views
gem 'haml'

# Authentication and Authorization
gem 'cancan'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'therubyracer', :platform => :ruby
	gem 'mysql2'
end

group :test do
  gem 'cucumber-rails'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'launchy' # Provides save_and_open_page in rspecs
  gem 'turn', :require => false
	gem 'webrat'
	gem 'factory_girl_rails'
	gem 'mocha'
end

group :development do
	gem 'capistrano'
	gem 'sqlite3'
	gem 'annotate'
	gem 'nifty-generators'
	gem 'faker'
	gem 'spork', '~> 0.9.0.rc'
	gem 'autotest'
	gem 'autotest-rails-pure'
	gem 'autotest-fsevent'
	gem 'autotest-growl'	
	gem 'pry'
end
