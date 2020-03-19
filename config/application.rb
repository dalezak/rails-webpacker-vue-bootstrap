require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Starter
  class Application < Rails::Application
    config.load_defaults 6.0

    config.autoload_paths += Dir[Rails.root.join('app', 'jobs', '**/')]
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '**/')]
    config.autoload_paths += Dir[Rails.root.join('app', 'mailers', '**/')]

    config.action_view.sanitized_allowed_tags = ['strong', 'em', 'a', 'ol', 'ul', 'li', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'b', 'i', 'img', 'br', 'span', 'div', 'hr', 'blockquote', 'p']
    config.action_view.sanitized_allowed_attributes = ['id', 'name', 'class', 'style', 'title', 'src', 'href', 'alt']
  end
end
