require './app'
require 'sidekiq/web'

run Rack::URLMap.new('/' =>  SecretMessages, '/sidekiq' => Sidekiq::Web)
