require 'sinatra/base'

class GithubApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/read' do
  end

  post '/create' do
  end

  post '/update' do
  end

  post '/delete' do
  end 



  # start the server if ruby file executed directly
  run! if app_file == $0
end
