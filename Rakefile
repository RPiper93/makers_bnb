require 'data_mapper'
require_relative 'app/app.rb' 

namespace :db do
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data lost)"
  end

  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data may be lost)"
  end
end
