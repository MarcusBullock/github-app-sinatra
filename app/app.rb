require 'sinatra/base'
require 'rest-client'
require 'json'

class GithubApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/read' do
    users = User.all
    JSON.generate(users)
  end

  post '/create' do
    api_result = RestClient.get 'https://api.github.com/users/ScottGledhill?access_token=2a1f0daf2b47c0ef1c4886653f73d9b678b76ed5'
    jhash = JSON.parse(api_result)
    login = jhash["login"]
    followers = jhash["followers"]
    avatar_url = jhash["avatar_url"]
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
