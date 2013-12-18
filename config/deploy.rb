require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require 'capistrano-unicorn'
require 'rvm/capistrano'

set :application,     'anoside'
set :deploy_via,      :remote_cache
set :repository,      "git@github.com:anoside/#{application}.git"
set :rvm_ruby_string, "ruby-2.0.0-p353@#{application}"
set :rvm_type,        :system
set :scm,             :git
set :user,            'root'
set :use_sudo,        false

ssh_options[:forward_agent] = true
default_run_options[:pty]   = true

set :default_environment, {
  'PATH'   => '/usr/local/bin:$PATH',
  'LANG'   => 'en_US.UTF-8',
  'LC_ALL' => 'en_US.UTF-8'
}

namespace :deploy do
  task :copy_database_yml do
    run "cp #{shared_path}/database.yml #{release_path}/config/"
  end

  #pid_file_path = '/var/www/anoside/shared/pids/unicorn.pid'

  #task :start, roles: :app do
    #run "cd #{current_path}; bundle exec unicorn_rails -c config/unicorn.rb -E #{rails_env} -D"
  #end

  #task :stop, roles: :app do
    #run "kill -s QUIT `cat #{pid_file_path}`"
  #end

  #task :restart, roles: :app, except: { no_release: true } do
    #if File.exist?(pid_file_path)
      #run "kill -s USR2 `cat #{pid_file_path}`"
    #end
  #end
end

before 'deploy:restart', 'deploy:copy_database_yml'
after  'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after  'deploy:restart', 'unicorn:restart'   # app preloaded
after  'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime deployments)
after  'deploy:restart', 'deploy:cleanup'
