# frozen_string_literal: true

require 'lib/pandemic'

class GoofSite < Sinatra::Base
  get '/' do
    @goof = Pandemic.goof
    erb :index
  end

  get '/api' do
    json goof: Pandemic.goof
  end

  post '/' do
    404
  end

  post '/api' do
    404
  end
end
