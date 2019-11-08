source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"
gem "active_storage_validations"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.1.0", require: false
gem "config"
gem "fast_jsonapi"
gem "figaro"
gem "mysql2"
gem "paranoia"
gem "puma", "~> 3.11"
gem "rack-cors"
gem "rails", "~> 5.2.3"
gem "rails-i18n"
gem "rubocop", "~> 0.71.0"
gem "jwt"
gem "will_paginate"

group :development, :test do
  gem "annotate"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "faker"
  gem "sidekiq"
end

group :test do
  gem "database_cleaner"
  gem "factory_bot_rails", require: false
  gem "rspec-collection_matchers"
  gem "rspec_junit_formatter"
  gem "rspec-rails"
  gem "shoulda-matchers"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "pry"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
