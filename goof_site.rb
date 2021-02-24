# frozen_string_literal: true

require 'lib/pandemic'

class GoofSite < Sinatra::Base
  get '/' do
    "<!DOCTYPE html>
     <html>
       <head>
         <title>Pandemic Goofs</title>
         <link rel='shortcut icon' type='image/png' href='icons/microbe.png'/>
       </head>
       <body style='background-color:#ffdead;'>
         <div align='center' style='font-family: Arial;font-size: 14pt;'>
           <p>Instead of saying, <br />\"In this global pandemic?\"</p>

           <p>Try saying, <br />\"#{Pandemic.goof}\"</p>

           <p><a href='/' style='color: black;font-family: Arial;font-size: 10pt;'>refresh</a></p>
         </div>

         <div align='center' style='margin-top:300px;'>
           <a href='/api' target='_blank' style='color: black;font-family: Arial;font-size: 10pt;'>Check out our awesome API</a>
       </body>
     </html>"
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
