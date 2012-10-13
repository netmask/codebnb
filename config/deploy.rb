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

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && bundle exec unicorn -c config/unicorn.rb -E production -D"
  end
end
