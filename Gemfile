source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.8", ">= 7.0.8.6"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # enviroments variables
  gem 'dotenv', '~> 3.1', '>= 3.1.4'
  # rspec-rails integrates the Rails testing helpers into RSpec.
  gem 'rspec-rails', '~> 7.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  # Code coverage for Ruby with a UI
  gem 'simplecov', '~> 0.22.0'
end

group :development do
  gem "web-console"
end

