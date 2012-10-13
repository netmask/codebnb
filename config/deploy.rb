require "bundler/capistrano"

set :application, 'codebnb'
set :repository,  "git@github.com:netmask/codebnb.git"
set :user, 'rails'
set :scm, :git
set :deploy_to, '/opt/apps'

set :default_environment, {
  'PATH' => "/usr/bin:/opt/local/bin/"
}


role :app, "rubybnb.devmask.net"
role :web, "rubybnb.devmask.net"
role :db, "rubybnb.devmask.net", :primary => true

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "source /opt/apps/github && cd #{current_path} && bundle exec unicorn_rails -c config/unicorn.rb -E production -D"
  end

  task :stop, :roles => :app, :except => { :no_release => true } do
    run "kill `cat /opt/apps/shared/pids/unicorn.pid`"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    begin
      stop
    rescue
      puts "An error stoping the process"
    end
    run "cp /opt/apps/database.yml /opt/apps/current/config/database.yml"
    migrate
    start
  end
end
