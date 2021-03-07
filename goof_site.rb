# frozen_string_literal: true

require 'config/environment'
require 'env'
require 'pandemic'

class GoofSite < Sinatra::Base
  before do
    if Env.force_ssl?(request)
      redirect request.url.sub('http', 'https')
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

    output = []
    Files.full_list.each do |file|
      lines = Files.lines(file)
      output << "There are #{lines} lines in <a href='/contents/#{file}'>data/#{file}.txt</a>"
    end

    "<!DOCTYPE html>
    <html>
      <head>
        <title>Development Status</title>
      </head>
      <body style='font-family: Courier New;'>
        <div style='margin-left:10px;'>
          <h4>Development Status</h4>
          <ul style='padding-left:10px;'>
            <li>#{output.join("</li>\n            <li>")}</li>
          </ul>
        </div>
      </body>
    </html>"
  end

  get '/contents/:filename' do
    redirect '/' unless Env.development?

    file = "data/#{params['filename']}.txt"
    unless File.exist? file
      halt 404, '<div style="font-family: Courier New;">404 - Invalid filename</div>'
    end

    lines = File.readlines(file)

    "<!DOCTYPE html>
    <html>
      <head>
        <title>#{file}</title>
      </head>
      <body style='font-family: Courier New;'>
        <div style='margin-left:10px;'>
          <h4>#{file} (#{lines.count} entries)</h4>
          <ol>
            <li>#{lines.map(&:chomp).join("</li>\n            <li>")}</li>
          </ol>
        </div>
      </body>
    </html>"
  end

  # catch-all routes
  get '/*' do
    redirect '/'
  end

  post '/*' do
    404
  end
end
