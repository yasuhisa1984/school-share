require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.


module SchoolShare
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.i18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.helper false
      g.assets false
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
