ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'rest_client'
require_relative 'dm_setup'
require 'json'
require 'dotenv'
Dotenv.load

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
    api_result = RestClient.get "https://api.github.com/users/MarcusBullock?access_token=#{ENV['ACCESS_TOKEN']}"
    jhash = JSON.parse(api_result)
    jarray << jhash
    jarray.each do |user|
      User.create(url: user['html_url'],
                  username: user['login'],
                  repo_count: user['public_repos'],
                  follower_count: user['followers'],
                  avatar: user['avatar_url']
                  )
    end
  end
  run! if app_file == $0
end
