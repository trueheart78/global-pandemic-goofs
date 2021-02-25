# frozen_string_literal: true

require 'config/environment'
require 'env'
require 'pandemic'

class GoofSite < Sinatra::Base
  before do
    if Env.force_ssl?(request)
      redirect request.url.sub('http', 'https')
    end
  end

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

  get '/status' do
    redirect '/' unless Env.development?
    Env.host(request)
  end
end
