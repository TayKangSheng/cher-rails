source "https://rubygems.org"

ruby "2.4.2"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.4"
gem "turbolinks", "~> 5"

# html, css and js
gem "bootstrap", "~> 4.0.0.beta2.1"
gem "jquery-rails"
gem "rails_utils"
gem "sass-rails", "~> 5.0"
gem "slim-rails"
gem "uglifier", ">= 1.3.0"

gem "bcrypt", "~> 3.1.7"
gem "devise"

gem "simple_form"

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "rubocop", require: false
  gem "rubocop-github"
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]

  gem "rspec-rails"
  gem "shoulda-matchers", "~> 3.1"

  gem "dotenv-rails"

  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
