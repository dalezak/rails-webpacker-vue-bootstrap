source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

gem 'pg', '>= 0.18', '< 2.0'

gem 'puma', '~> 4.3'
gem "puma_worker_killer", "~> 0.1.1"

gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem "paranoia", "~> 2.4"
gem "annotate", "~> 3.1"
gem "rails-erd", "~> 1.6"

gem "devise", "~> 4.7"
gem "devise-jwt", "~> 0.6.0"
gem "cancancan", "~> 3.1"

gem "delayed_job", "~> 4.1"
gem "delayed_job_active_record", "~> 4.1"

gem "mail", "~> 2.7"
gem "sendgrid", "~> 1.2"
gem "sendgrid-ruby", "~> 6.1"

gem "faker", "~> 2.10"

gem "js-routes", "~> 1.4"
gem "vueonrails", "~> 0.3.0"

gem "httparty", "~> 0.18.0"
gem "nokogiri", "~> 1.10"
gem "simple-rss", "~> 1.3"
gem "sitemap_generator", "~> 6.1"

gem "rack-cors", "~> 1.1"
gem "rack-attack", "~> 6.2"
gem "rack-timeout-puma", "~> 0.0.1"

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "bullet", "~> 6.1"
  gem "brakeman", "~> 4.8"
  gem "memory_profiler", "~> 0.9.14"
  gem "derailed_benchmarks", "~> 1.6"
  gem "rubocop", "~> 0.80.1"
  gem "better_errors", "~> 2.6"
  gem "binding_of_caller", "~> 0.8.0"
  gem "rack-mini-profiler", "~> 2.0"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
