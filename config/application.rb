require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
ENV.update YAML.load_file('config/settings.yml')[Rails.env] rescue {}

module Poolcket
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.consumer_key = ENV['CONSUMER_KEY'] || 'YOUR_CONSUMER_KEY'
    config.assets.paths << "#{config.root}/vender/assets/fonts"
  end
end
