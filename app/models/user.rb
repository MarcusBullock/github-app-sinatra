require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :url, String, length: 200
  property :username, String, unique: true
  property :repo_count, Integer
  property :follower_count, Integer
  property :avatar, String, length: 200

end
