source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.12'

# Controller
gem 'inherited_resources', '1.3.1'

# Model
gem 'acts-as-taggable-on', '2.3.3'
gem 'enumerize', '0.5.0'
gem 'mysql2', '0.3.11'

# View
gem 'flutie', '2.0.0'
gem 'jbuilder', '0.8.2'
gem 'simple_form', '2.0.4'
gem 'slim-rails', '1.0.3'

# Other
gem 'cld', '0.7.0'
gem 'devise', '2.1.2'
gem 'rails_config', '0.3.1'
gem 'sidekiq', '2.5.3'

# https://github.com/iain/http_accept_language/issues/22
gem 'http_accept_language', github: 'DouweM/http_accept_language', branch: 'no-middleware-no-crash'


group :development, :test do
  gem 'capybara', '2.0.2'
  gem 'capybara-webkit', '0.14.2'
  gem 'database_cleaner', '0.9.1'
  gem 'factory_girl_rails', '4.2.1'
  gem 'pry-rails', '0.2.2'
  gem 'rspec-rails', '2.12.2'
  gem 'spork-rails', '3.2.0'
end

group :assets do
  gem 'bourbon', '2.1.2'
  gem 'coffee-rails', '3.2.2'
  gem 'font-awesome-sass-rails', '2.0.0.0'
  gem 'jquery-rails', '2.1.3'
  gem 'sass-rails', '3.2.5'
  gem 'uglifier', '1.3.0'
end

group :development do
  gem 'awesome_print', '1.1.0'
  gem 'growl', '1.0.3'
  gem 'guard-rspec', '2.1.2'
  gem 'guard-spork', '1.2.3'
  gem 'mailcatcher', '0.5.10'
  gem 'quiet_assets', '1.0.1'
  gem 'rb-fsevent', '0.9.2', require: false # used in Guard
  gem 'thin', '1.5.0'
end

group :test do
  gem 'capybara-screenshot', '0.3.4'
  gem 'fuubar', '1.1.0'
  gem 'simplecov', '0.7.1', require: false
end
