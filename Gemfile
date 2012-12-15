source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails'

# Controller
gem 'inherited_resources'

# Model
gem 'acts-as-taggable-on'
gem 'client_side_validations'
gem 'enumerize'
gem 'mysql2'
gem 'validates_email_format_of'

# View
gem 'active_decorator'
gem 'jbuilder'
gem 'simple_form'
gem 'slim-rails'

# Others
gem 'cld'
gem 'devise'
gem 'exception_notification'
gem 'sidekiq'

# https://github.com/iain/http_accept_language/issues/22
gem 'http_accept_language', github: 'DouweM/http_accept_language', branch: 'no-middleware-no-crash'


group :development, :test do
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rvm-capistrano'
  gem 'spork-rails'
end

group :assets do
  gem 'bourbon'
  gem 'coffee-rails'
  gem 'flutie'
  gem 'font-awesome-sass-rails'
  gem 'handlebars_assets'
  gem 'jquery-rails'
  gem 'sass-rails'
  gem 'uglifier'
  gem 'underscore-rails'
end

group :development do
  gem 'awesome_print'
  gem 'growl'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'mailcatcher'
  gem 'powder'
  gem 'quiet_assets'
  gem 'rb-fsevent', require: false # used in Guard
  gem 'thin'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'capybara-screenshot'
  gem 'fuubar'
  gem 'simplecov', require: false
end
