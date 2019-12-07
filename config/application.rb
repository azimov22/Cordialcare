require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Erp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    ActiveSupport::JSON::Encoding.time_precision = 0

    config.autoload_paths += %W(#{Rails.root}/config/routes)
    config.autoload_paths += %W(#{config.root}/app/classes)
    config.autoload_paths += [config.root.join('app')]

    config.filter_parameters << :password
    Raven.configure do |config|
      config.environments = %w(production)
      config.dsn = 'https://236505b969b649a3bdced6351ec50ae9:9bb3460eeadb43a280e0d99efbb0dfc0@sentry.io/1533773'
      config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
    end
  end
end

