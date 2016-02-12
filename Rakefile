require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end


  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end
end


# rake -T # displays the rake commands like the below:
# rake db:auto_migrate    # Destructive upgrade
# rake db:auto_upgrade    # Non destructive upgrade

# to run for local databases:
#   $ rake db:auto_upgrade RACK_ENV=test
#   $ rake db:auto_upgrade # Default RACK_ENV is development so we don't need to be explicit.
# to run for heroku:
#   $ heroku run rake db:auto_upgrade # Default RACK_ENV on heroku is 'production'
