# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Kyiv'
    config.i18n.available_locales = %i[en ua]
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.template_engine nil
      g.test_framework nil
      g.assets false
      g.helper false
      g.stylesheets false
    end
  end
end
