require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SpaceshipParkingLotApi
  class Application < Rails::Application
    config.i18n.default_locale = :'pt-BR'

    config.autoload_paths << Rails.root.join("app")
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
  end
end
