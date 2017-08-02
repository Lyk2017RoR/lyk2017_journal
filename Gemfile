source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'execjs'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'derailed'
  gem 'stackprof'
  gem 'bullet'
end

group :development do
  gem 'byebug'
  gem 'annotate'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'spring-commands-rspec'
  gem 'guard-rspec', require: false
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'vcr', require: false
  gem 'shoulda-matchers', '~> 3.0'
  gem 'rails-controller-testing'
end
