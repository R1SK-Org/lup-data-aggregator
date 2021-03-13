require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV.fetch("LDA_ENV", "development"))

require 'dotenv/load'
require_relative 'lib/lda'
