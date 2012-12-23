source 'https://rubygems.org'

gem 'rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

#UI
#Device/Feature Detection
gem 'modernizr-rails'
gem 'mobile-fu'

#Form/Validation
gem 'simple_form'
gem 'country_select'
gem 'validates_timeliness'

#Decorators for models
gem 'draper', '0.18.0'

#Pagination for models
gem 'kaminari'
gem 'kaminari-bootstrap'

#ics support
gem 'icalendar'

group :development, :test do
  gem 'debugger'
  gem 'rspec-rails', '>= 2.9.0'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'database_cleaner'
  gem 'brakeman'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
  gem 'spork-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rb-fsevent'
  gem 'simplecov', :require => false
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'compass-rails'
  gem 'font-awesome-sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development, :test do
  gem 'capybara'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'rspec-rails', "~> 2.0"
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'spork'
  gem "launchy"
end

gem 'win32console'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
