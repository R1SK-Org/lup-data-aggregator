require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV.fetch("CDA_ENV", "development"))

require 'dotenv/load'
require_relative 'lib/cda'
