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
    @url = Env.host(request)
    @image = [@url, 'images', 'microbe.png'].join '/'
    @domain = Env.domain(request)
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
      output << "There are #{lines} lines in <a href='/contents/#{file}'>data/#{file}.txt</a><br />"
    end
    "<html>
      <head>
        <title>Development Status</title>
      </head>
      <body style='font-family: Courier New;'>
        <h4>Development Status</h4>
        #{output.join}
      </body>
    </html>"
  end

  get '/contents/:filename' do
    redirect '/' unless Env.development?
    file = "data/#{params['filename']}.txt"

    halt(404, '<div style="font-family: Courier New;">404 - Invalid filename</div>') unless File.exist? file

    lines = File.readlines(file)

    "<html>
      <head>
        <title>#{file}</title>
      </head>
      <body style='font-family: Courier New;'>
        <h4>#{file} (#{lines.count} entries)</h4>
        #{lines.join('<br />')}
      </body>
    </html>"
  end
end
