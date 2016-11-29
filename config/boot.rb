require 'rubygems'
require 'bundler'

ENV['RACK_ENV'] ||= 'development'

Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sidekiq'

# models loading
Dir.glob(File.expand_path("models/*.rb")) { |file| require_relative file}

# workers loading
Dir.glob(File.expand_path("workers/*.rb")) { |file| require_relative file}
