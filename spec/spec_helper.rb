# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
<<<<<<< HEAD
require 'capybara/rspec'
require 'capybara/rails'
=======
>>>>>>> eab9940342f20e796a0ee398ddd7a9d1471e4bfb

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
<<<<<<< HEAD
  config.mock_with :rspec
=======
>>>>>>> eab9940342f20e796a0ee398ddd7a9d1471e4bfb
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
<<<<<<< HEAD
  config.use_transactional_fixtures = false
=======
  config.use_transactional_fixtures = true
>>>>>>> eab9940342f20e796a0ee398ddd7a9d1471e4bfb

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

<<<<<<< HEAD
  config.include Warden::Test::Helpers
  config.include Devise::TestHelpers, :type => :controller
  config.include ControllerHelpers, :type => :controller
  Capybara.javascript_driver = :webkit

  class ActiveRecord::Base
    mattr_accessor :shared_connection
    @@shared_connection = nil

    def self.connection
      @@shared_connection || retrieve_connection
    end
  end

  # Forces all threads to share the same connection. This works on
  # Capybara because it starts the web server in a thread.
  ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

  # Setup Database Cleaner
  DatabaseCleaner.clean_with :truncation
  DatabaseCleaner.strategy = :transaction

=======
>>>>>>> eab9940342f20e796a0ee398ddd7a9d1471e4bfb
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
<<<<<<< HEAD
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:eah) do

    DatabaseClener.clean
  end
=======
>>>>>>> eab9940342f20e796a0ee398ddd7a9d1471e4bfb
  config.order = "random"
end
