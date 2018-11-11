# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'mini_racer', platforms: :ruby
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1'
gem 'redis', '~> 4.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# util
gem 'aasm'
gem 'action_args'
gem 'active_decorator'
gem 'active_hash'
gem 'active_link_to'
gem 'cancancan'
gem 'cocoon'
gem 'config'
gem 'counter_culture'
gem 'hiredis'
gem 'html5_validators'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'meta-tags'
gem 'seed-fu'
gem 'slim-rails'

# bootstrap
gem 'bootstrap'
gem 'bootstrap4-datetime-picker-rails'
gem 'font-awesome-rails'
gem 'momentjs-rails'

# carrierwave
gem 'carrierwave'
gem 'fog-aws'

# devise
gem 'devise'
gem 'devise-i18n'
gem 'omniauth'
gem 'omniauth-facebook'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'hirb'
  gem 'pry-byebug'
  gem 'pry-coolline'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
end

group :development do
  gem 'annotate'
  gem 'html2slim'
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'migration_comments'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
