source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.1'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development

gem 'execjs'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'bootstrap-sass' # For styling
gem 'devise', '~> 3.2.4' # For user authentication
gem 'geocoder', '~> 1.2.2' # For location based filtering
gem 'cancan', '~> 1.6.10' # For role based authroization
gem 'roo' # For excel processing
gem 'ransack', '~> 1.2.3' # For data filtering
gem 'kaminari' # Table pagination
gem 'kaminari-bootstrap', '~> 0.1.3'


group :production do
  gem 'rails_12factor' # Asset precompiler for heroku
  gem 'pg' # Postgres Database
end

group :development, :test do
  gem 'sqlite3'
  gem 'guard' # Monitor files and perform action when saved
  gem 'guard-livereload' # Reloads browser when file is saved
  gem 'guard-rspec' # Test Suite
  gem 'rspec-rails' # Testing Library for Ruby
  gem 'capybara' # Integration testing with rails
  gem 'factory_girl_rails' # For instances of Active Record Objects
  gem 'database_cleaner' # Cleans up datase after tests run
  gem 'shoulda-matchers' # Matchers for testing models and controllers
end