require 'rubygems'
require 'spork'

Spork.prefork do
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'database_cleaner'

  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  Capybara.javascript_driver = :webkit

  RSpec.configure do |config|
    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    config.include Devise::TestHelpers, type: :controller
    
    config.include Warden::Test::Helpers
    Warden.test_mode!

    DatabaseCleaner.strategy = :truncation
  end
end

Spork.each_run do
  if ENV['DRB']
    require 'simplecov'
  end

  RSpec.configure do |config|
    config.after(:each) do
      DatabaseCleaner.clean
      FactoryGirl.reload
    end
  end
end