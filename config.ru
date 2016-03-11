require 'rubygems'
require 'rack/cors'
require File.join(File.dirname(__FILE__), 'app/app.rb')

use Rack::Cors do

  allow do
    origins '*'
    resource '/*', :headers => :any, :methods => :any
  end
end

run GithubApp
