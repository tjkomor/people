source 'https://rubygems.org'
fury_url = ENV['GEMFURY_URL'] # IDK how much we care whether people know the jsl-identity url, but we'll inject it just in case
source fury_url if fury_url

ruby '2.1.3'

gem 'turing_auth', path: "../turing_auth"
gem 'thin'
gem 'rails', '4.1.7'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'haml'
gem 'compass-rails'
gem 'redcarpet'
gem 'formtastic'
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'
gem 'jsl-identity', '= 0.0.7', require: 'jsl/identity' # for accessing user identities (comes from Gemfury)
gem 'deject'                                           # dependency injection
gem 'honeybadger'

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'simplecov'
end

group :production do
  gem 'rails_12factor'
end
