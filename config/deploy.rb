require "bundler/capistrano"

set :application, 'codebnb'
set :repository,  "git@github.com:netmask/codebnb.git"
set :user, 'rails'
set :scm, :git
set :deploy_to, '/opt/apps'

set :default_environment, {
  'PATH' => "/usr/bin:/opt/local/bin/"
}


role :web, "rubybnb.devmask.net"                                        # Your HTTP server, Apache/etc
role :app, "rubybnb.devmask.net"                          # This may be the same as your `Web` server

set :shared_children, shared_children << 'tmp/sockets'

namespace :deploy do
  desc "Start the application"
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && RAILS_ENV=production bundle exec puma -b 'unix://#{shared_path}/sockets/puma.sock' -S #{shared_path}/sockets/puma.state --control 'unix://#{shared_path}/sockets/pumactl.sock' >> #{shared_path}/log/puma-production.log 2>&1 &", :pty => false
  end

  desc "Stop the application"
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && RAILS_ENV=production bundle exec pumactl -S #{shared_path}/sockets/puma.state stop"
  end

  desc "Restart the application"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && RAILS_ENV=production bundle exec pumactl -S #{shared_path}/sockets/puma.state restart"
  end

  desc "Status of the application"
  task :status, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && RAILS_ENV=production bundle exec pumactl -S #{shared_path}/sockets/puma.state stats"
  end
end
