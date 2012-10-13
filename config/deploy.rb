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
