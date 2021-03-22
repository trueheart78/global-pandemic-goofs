# frozen_string_literal: true

require 'config/environment'
require 'env'
require 'pandemic'

class GoofSite < Sinatra::Base
  before do
    headers 'Referrer-Policy' => 'strict-origin-when-cross-origin'
    headers 'Strict-Transport-Security' => 'max-age=16070400; includeSubDomains'

    if Env.force_ssl?(request)
      redirect request.url.sub('http', 'https'), 308
    else
      @url = Env.host(request)
      @image = [@url, 'images', 'microbe.png'].join '/'
      @domain = Env.domain(request)
    end
  end

  get '/' do
    @goof = Pandemic.goof

    erb :index
  end

  get '/about' do
    erb :about
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

    require 'files'

    @output = []
    Files.full_list.each do |filename|
      lines = Files.lines(filename)
      @output << "There are #{lines} lines in <a href='/contents/#{filename}'>data/#{filename}.txt</a>"
    end

    erb :status, layout: :dev_layout
  end

  get '/contents/:filename' do
    redirect '/' unless Env.development?

    @filename = params['filename']
    file_path = "data/#{@filename}.txt"
    unless File.exist? file_path
      halt 404, '<div style="font-family: Courier New;">404 - Invalid filename</div>'
    end

    @lines = File.readlines(file_path)

    erb :contents, layout: :dev_layout
  end

  # catch-all routes
  get '/*' do
    redirect '/'
  end

  post '/*' do
    404
  end
end
