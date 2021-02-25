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
    # Env.host(request)
    require 'files'

    output = []
    Files.full_list.each do |file|
      lines = `wc -l data/#{file}.txt`.to_i
      output << "There are #{lines} lines in data/#{file}.txt<br />"
    end
    output.join
  end
end
