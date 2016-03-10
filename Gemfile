source 'https://rubygems.org'


gem 'rails', '>= 5.0.0.beta2', '< 5.1'

gem 'pg', '~> 0.18'
gem "devise", "~> 4.0.0.rc1"
gem "simple_form", "~> 3.2.1"
gem "cancancan", "~> 1.13.1"

gem 'puma'

gem "bootstrap", "~> 4.0.0.alpha3"
gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Action Cable dependencies for the Redis adapter
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'


gem "haml"

group :development, :test do
  gem "pry-rails"
  gem "rspec-rails", "~> 3.1.0"
  gem "factory_girl_rails", "~> 4.6.0"
end

group :test do
  gem "capybara", "~> 2.6.2"
  gem "database_cleaner"
  gem "shoulda"
end

group :development do
  gem "erb2haml"
  gem "capistrano", "~> 3.4", require: false
  gem 'capistrano-rbenv',     require: false
  gem 'capistrano-rails',     require: false
  gem 'capistrano-bundler',   require: false
  gem 'capistrano3-puma',     require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
