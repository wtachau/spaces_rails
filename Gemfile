source 'https://rubygems.org'
ruby "2.2.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use slim for templating
gem "slim-rails"
# Use Bootstrap for mobile styling
gem 'bootstrap-sass', '~> 3.3.3'
# Sprocket
gem 'sprockets-rails', :require => 'sprockets/railtie'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# use responders to respond using JSON
gem 'responders', '~> 2.0'
#include React.js to make frontend faster
gem 'react-rails', github: 'reactjs/react-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Selectize for form input
gem 'selectize-rails', '~> 0.11.2'
# Acts-as-Taggable for tagging system
gem 'acts-as-taggable-on', '~> 3.4'
# Acts-as-Commentable for comments
gem 'acts_as_commentable'
# time_diff for time differences
gem 'time_diff', '~> 0.3.0'
# use draper for view decorators
gem 'draper', '~> 1.4.0'
# for auto linking
gem 'rails_autolink'
# For autocomplete in tagging people
gem 'jquery-textcomplete-rails'
# For uploading files
gem "mini_magick"
gem "refile", require: ["refile/rails", "refile/image_processing"]
gem "aws-sdk", '< 2'
# To enable file upload in remote form submissions
gem 'remotipart', '~> 1.2'
# Select for bootstrap
gem 'bootstrap-select-rails', '~> 1.6.3'

# There is an awesome Chrome extension for rails which gives you an extra tab on your dev tools
# https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg?hl=en-US
# To use it you need Meta Request
gem 'meta_request'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'dotenv-rails'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end