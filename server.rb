# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require :default

get '/' do
  'global pandemic'
end
