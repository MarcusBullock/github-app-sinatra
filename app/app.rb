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
    response['Access-Control-Allow-Origin'] = 'http://localhost:8080'
    users = User.all
    JSON.generate(users)
  end

  post '/create' do
    api_result = RestClient.get "https://api.github.com/users?per_page=100&access_token=#{ENV['ACCESS_TOKEN']}"
    jhash = JSON.parse(api_result)


    jhash.each do |user|
      user_id = user['login']
      user1 = RestClient.get "https://api.github.com/users/#{user_id}?access_token=#{ENV['ACCESS_TOKEN']}"
      userjson = JSON.parse(user1)
      User.create(url: userjson['html_url'],
      username: userjson['login'],
      repo_count: userjson['public_repos'],
      follower_count: userjson['followers'],
      avatar: userjson['avatar_url']
      )
    end

    redirect '/read'
  end
  run! if app_file == $0
end
