require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc 'Non-destructive db upgrade'
  task :au do
    DataMapper.auto_upgrade!
    puts 'auto_upgrade complete (no data lost)'
  end

  dest 'Destructive upgrade'
  task :am do
    DataMapper.auto_migrate!
    puts 'auto_migrate complete (data lost)'
  end
end
