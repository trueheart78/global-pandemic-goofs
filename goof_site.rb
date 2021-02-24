# frozen_string_literal: true

require 'lib/pandemic'

class GoofSite < Sinatra::Base
  get '/' do
    ['In this ', Pandemic.goof, '?'].join
  end

  get '/api' do
    json goof: Pandemic.goof
  end

  post '/' do
    404
  end
end
