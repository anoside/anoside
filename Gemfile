source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.1'

gem 'cld'
gem 'coffee-rails'
gem 'devise'
gem 'enumerize'
gem 'flutie'
gem 'font-awesome-sass'
gem 'jbuilder'
gem 'jquery-rails'
gem 'mysql2'
gem 'rails_config'
gem 'sass-rails'
gem 'sidekiq'
gem 'slim'

# https://github.com/iain/http_accept_language/issues/22
gem 'http_accept_language', github: 'DouweM/http_accept_language', branch: 'no-middleware-no-crash'

group :assets do
  gem 'uglifier'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller' # using better_errors
  gem 'mailcatcher'
  gem 'quiet_assets'
  gem 'spring'
  gem 'spring-commands-rspec', require: false
  gem 'thin'
end

group :development, :test do
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'nyan-cat-formatter'
  gem 'poltergeist'
  gem 'shoulda-matchers'
end
