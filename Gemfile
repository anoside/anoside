source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.8'

# Controller
gem 'inherited_resources'

# Model
gem 'client_side_validations'
gem 'mysql2'
gem 'validates_email_format_of'

# View
gem 'active_decorator'
gem 'jbuilder'
gem 'simple_form'
gem 'slim-rails'

# Others
gem 'devise'
gem 'exception_notification'


group :development, :test do
  gem 'capistrano'
  gem 'capistrano_colors'
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
