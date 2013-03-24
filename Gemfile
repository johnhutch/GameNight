source 'http://rubygems.org'

gem 'rails', '3.2.12'

group :assets do
  gem 'sass-rails',   '~> 3.2.6'
  gem 'compass-rails'
  gem 'bootstrap-sass'
  gem 'susy'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.3.0'
end

gem 'jquery-rails', '~> 2.2.1'
gem 'mysql2'
gem 'capistrano'
gem 'json'

gem 'cancan', '~> 1.6.9'
gem 'devise', '~> 2.2.3'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

gem 'simple_form'
gem 'redcarpet'
gem 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"
gem 'nested_form'
gem 'rails_config'
gem 'stamp'
gem "rails3-jquery-autocomplete"


group :production do
  gem 'therubyracer'
  gem 'execjs'
end

group :development, :test do
    gem 'sqlite3'
    gem 'rspec-rails'
    gem "letter_opener"
    gem 'thin'
    gem 'better_errors'
    gem 'binding_of_caller'
    gem 'meta_request'
end

group :test do
    gem 'factory_girl'
    gem 'factory_girl_rails', :require => false
    gem 'capybara-webkit'
    gem 'guard-rspec'
    gem 'launchy'
    gem 'rb-fsevent' # mac-only gem for guard auto-detect. remove if on another OS
    gem 'database_cleaner'
    gem 'spork', '~> 0.9.2'
    gem 'guard-spork'
end
