# frozen_string_literal: true

source "https://rubygems.org"
git_source( :github ) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.5"

gem "highline", "~> 3.1"
gem "rake", "~> 13.3"

group :development, :test do
  gem "bundler-audit", require: false
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rspec", require: false
end

group :test do
  gem "rspec", "~> 3.13"
end
