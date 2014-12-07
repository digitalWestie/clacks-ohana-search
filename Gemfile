source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.1.2'
gem 'rails', '~> 4.1.1'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'pry-byebug'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn'
gem 'ohanakapa', '~> 1.1.1'
gem 'faraday-http-cache', '~> 0.4.0'

# App config and ENV variables for heroku.
gem 'figaro', '~> 1.0.0'

# Handles logic behind Pagination UI component.
gem 'kaminari'

# Caching
gem 'rack-cache', '~> 1.2'
gem 'dalli', '~> 2.7.1'
gem 'memcachier'

# Required for caching in production.
gem 'kgio'
