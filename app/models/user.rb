require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :url, String
  property :username, String
  property :repo_count, Integer
  property :follower_count, Integer
  property :avatar, String
end
