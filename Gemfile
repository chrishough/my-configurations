# frozen_string_literal: true

source "https://rubygems.org"
git_source( :github ) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.5"

gem "highline", "~> 3.1"

group :development, :test do
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rspec", require: false
end

group :test do
  gem "rspec", "~> 3.13"
end
