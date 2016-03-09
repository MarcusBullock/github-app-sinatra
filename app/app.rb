require 'sinatra/base'
require 'rest-client'
require 'json'

class GithubApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/read' do
    api_result = RestClient.get '[http://api.openweathermap.org/data/2.5/weather?q=London&appid=8dbcc5eceddae7ab2d858e41dcd0ad58&units=metric]'
    jhash = JSON.parse(api_result)
  end

  post '/create' do
    User.create
  end
  #
  # post '/update' do
  #
  # end

  post '/delete' do

  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
