source 'http://rubygems.org'

gem 'activerecord', '~> 7.0', :require => 'active_record'
gem 'bcrypt'
gem "pg", "~> 0.21"
gem 'rake'
gem 'require_all'
gem 'shotgun'
gem 'sinatra'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'thin'
gem 'bootstrap', '~> 5.2'
# gem 'rack', '~> 2.2', '>= 2.2.3'
gem 'rack'
gem 'pry'

group :test, :development do

  #comment out sqlite gem if using postgresql for test and development database
  gem 'sqlite3', '~> 1.3.6'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
end

