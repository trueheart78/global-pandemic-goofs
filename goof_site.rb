# frozen_string_literal: true

require 'lib/pandemic'

class GoofSite < Sinatra::Base
  get '/' do
    "<!DOCTYPE html>
     <html>
       <head>
         <title>Pandemic Goofs</title>
       </head>
       <body>
         <div align='center' style='font-family: Arial;font-size: 14pt;'>
           #{Pandemic.goof}
         </div>
       </body>
     </html>"
  end

  get '/api' do
    json goof: Pandemic.goof
  end

  post '/' do
    404
  end
end
