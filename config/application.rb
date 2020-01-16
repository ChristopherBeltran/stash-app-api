require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StashAppApi
  class Application < Rails::Application
    config.api_only = true
      config.middleware.use ActionDispatch::Cookies
      config.middleware.use ActionDispatch::Session::CookieStore
      config.autoload_paths << Rails.root.join('lib')
      config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins 'https://stashapp.herokuapp.com', 'http://localhost:3001', 'http://stashapp.herokuapp.com'
          resource '*', :headers => :any, :methods => [:get, :patch, :put, :delete, :post, :options]            
        end
      end

  end
end
