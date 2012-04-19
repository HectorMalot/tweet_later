source 'https://rubygems.org'

gem 'sinatra'
gem 'bcrypt-ruby', '~> 3.0.0'

# Views
gem 'haml'

# Authentication
gem 'omniauth-twitter'

# Authorization
gem 'cancan'

# Rack additions
gem 'rack-flash3'

# Models
gem 'data_mapper', "~> 1.2.0"
gem 'dm-sqlite-adapter'

group :production do
	gem 'mysql2'
	gem 'dm-mysql-adapter'
end

group :test do
  gem 'cucumber'
  gem 'rspec'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy' # Provides save_and_open_page in specs
	gem 'factory_girl'
	gem 'rack-test'
end

group :development do
  gem 'thin'
  gem 'shotgun'
	gem 'capistrano'
	gem 'sqlite3'
	gem 'pry'
end
