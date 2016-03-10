ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'rest_client'
require_relative 'dm_setup'
require 'json'

class GithubApp < Sinatra::Base

  get '/' do
    'hello world'
  end

  get '/read' do
    users = User.all
    JSON.generate(users)
  end

  post '/create' do
    jarray = []
    api_result = RestClient.get 'https://api.github.com/users/ScottGledhill?access_token=2a1f0daf2b47c0ef1c4886653f73d9b678b76ed5'
    jhash = JSON.parse(api_result)
    jarray << jhash
    jarray.each do |user|
      User.create(
                  url: user['html_url'],
                  username: user['login'],
                  repo_count: user['public_repos'],
                  follower_count: user['followers'],
                  avatar: user['avatar_url']
                  )
    end
>>>>>>> 1e5844b2b750d9691ed8da8d46c0ca7e9f2b94ef
  end
  run! if app_file == $0
end
